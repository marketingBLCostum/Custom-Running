# PowerShell script to update all product pages

# Define the navigation HTML from index.html
$navHTML = @'
    <!-- Navigation -->
    <!-- Top Bar -->
    <nav id="navbar" class="w-full bg-white border-b border-gray-100 sticky top-0 z-50 shadow-sm">
        <div class="bg-black text-white">
            <div class="container mx-auto px-6">
                <div class="h-8 flex items-center justify-between text-[11px]">
                    <div class="flex items-center space-x-4">
                        <div class="relative group">
                            <button id="language-toggle" class="flex items-center space-x-2 hover:opacity-80 transition-opacity" onclick="toggleLanguageMenu(this)">
                                <img src="images/BANDIERE/italia.jpg" alt="Italiano" class="w-5 h-3.5 object-cover rounded-sm">
                                <span>Italiano</span>
                                <i class="fas fa-chevron-down text-[10px] opacity-70"></i>
                            </button>
                            <div id="language-dropdown" class="absolute left-0 mt-1 w-40 bg-white text-gray-800 rounded-sm shadow-lg z-50 hidden" style="color: black !important;">
                                <a href="index.html" class="block px-4 py-2 hover:bg-gray-100 flex items-center space-x-2 text-black">
                                    <img src="images/BANDIERE/italia.jpg" alt="Italiano" class="w-5 h-3.5 object-cover rounded-sm">
                                    <span>Italiano</span>
                                </a>
                                <a href="ndex-en.html" class="block px-4 py-2 hover:bg-gray-100 flex items-center space-x-2 text-black">
                                    <img src="images/BANDIERE/english.jpg" alt="English" class="w-5 h-3.5 object-cover rounded-sm">
                                    <span>English</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="flex items-center space-x-6">
                        <a href="#contatti" class="text-gray-300 hover:text-white text-sm transition">Contattaci</a>
                        <a href="index.html" class="text-gray-300 hover:text-white text-sm transition">Torna al sito</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="bg-transparent">
            <div class="container mx-auto px-6">
                <div class="h-20 flex items-center justify-between gap-6">
                    <a href="https://www.bicycle-line.com/it/" target="_blank" class="flex items-center">
                        <img src="images/logodfs.png" alt="Bicycle Line" class="h-10 w-auto">
                    </a>

                    <div class="hidden lg:flex flex-1 items-center justify-center gap-8">
                        <a href="index.html#come-funziona" class="text-black hover:text-gray-700 text-[12px] font-medium uppercase tracking-[0.18em] transition">Come Funziona</a>
                        <a href="index.html#portfolio" class="text-black hover:text-gray-700 text-[12px] font-medium uppercase tracking-[0.18em] transition">Ispirazione</a>
                        <a href="index.html#sport" class="text-black hover:text-gray-700 text-[12px] font-medium uppercase tracking-[0.18em] transition">Crea la tua divisa</a>
                        <a href="index.html#contatti" class="text-black hover:text-gray-700 text-[12px] font-medium uppercase tracking-[0.18em] transition">Contattaci</a>
                        <a href="index.html#faq" class="text-black hover:text-gray-700 text-[12px] font-medium uppercase tracking-[0.18em] transition">FAQ</a>
                    </div>

                    <button id="mobile-menu-btn" class="md:hidden text-black" aria-label="Apri menu">
                        <i class="fas fa-bars text-xl"></i>
                    </button>
                </div>

                <div id="mobile-menu" class="hidden lg:hidden border-t border-gray-300 bg-white">
                    <div class="px-6 py-4 grid grid-cols-1 gap-3">
                        <a href="index.html#come-funziona" class="block text-center py-2 text-black hover:text-gray-700 font-medium text-sm transition">Come Funziona</a>
                        <a href="index.html#portfolio" class="block text-center py-2 text-black hover:text-gray-700 font-medium text-sm transition">Ispirazione</a>
                        <a href="index.html#sport" class="block text-center py-2 text-black hover:text-gray-700 font-medium text-sm transition">Crea la tua divisa</a>
                        <a href="index.html#contatti" class="block text-center py-2 text-black hover:text-gray-700 font-medium text-sm transition">Contattaci</a>
                        <a href="index.html#faq" class="block text-center py-2 text-black hover:text-gray-700 font-medium text-sm transition">FAQ</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
'@

# Define the footer HTML from index.html
$footerHTML = @'
    <!-- Footer -->
    <footer class="bg-white py-8 text-gray-700 text-sm">
        <div class="container mx-auto px-6">
            <div class="grid grid-cols-1 md:grid-cols-5 gap-6">
                <!-- Logo -->
                <div class="col-span-1">
                    <a href="https://www.bicycle-line.com/it/" target="_blank"><img src="images/logodfs.png" alt="Bicycle Line Logo" class="w-20 h-auto"></a>
                </div>

                <!-- BICYCLE LINE -->
                <div class="col-span-1">
                    <h3 class="font-bold text-gray-800 mb-3">BICYCLE LINE</h3>
                    <ul class="space-y-1">
                        <li><a href="https://www.bicycle-line.com/it/content/4-brand" class="hover:text-gray-800 transition">Brand</a></li>
                        <li><a href="https://www.bicycle-line.com/it/content/6-storia" class="hover:text-gray-800 transition">Storia</a></li>
                        <li><a href="https://www.bicycle-line.com/it/content/9-sostenibilita" class="hover:text-gray-800 transition">Sostenibilità</a></li>
                        <li><a href="https://www.bicycle-line.com/it/contact" class="hover:text-gray-800 transition">Contattaci</a></li>
                    </ul>
                </div>

                <!-- SHOP -->
                <div class="col-span-1">
                    <h3 class="font-bold text-gray-800 mb-3">SHOP</h3>
                    <ul class="space-y-1">
                        <li><a href="https://www.bicycle-line.com/it/947-uomo" class="hover:text-gray-800 transition">Uomo</a></li>
                        <li><a href="https://www.bicycle-line.com/it/948-donna" class="hover:text-gray-800 transition">Donna</a></li>
                        <li><a href="https://www.bicycle-line.com/it/949-cat-bambino" class="hover:text-gray-800 transition">Bambino</a></li>
                        <li><a href="https://www.bicycle-line.com/it/1109-offerte" class="hover:text-gray-800 transition">Offerte</a></li>
                        <li><a href="https://www.bicycle-line.com/it/content/23-shop" class="hover:text-gray-800 transition">Guida allo shopping online</a></li>
                    </ul>
                </div>

                <!-- LINK UTILI -->
                <div class="col-span-1">
                    <h3 class="font-bold text-gray-800 mb-3">LINK UTILI</h3>
                    <ul class="space-y-1">
                        <li><a href="https://www.bicycle-line.com/it/content/1-spedizione" class="hover:text-gray-800 transition">Spedizione</a></li>
                        <li><a href="https://www.bicycle-line.com/it/content/5-pagamento" class="hover:text-gray-800 transition">Pagamento</a></li>
                        <li><a href="https://www.bicycle-line.com/it/content/18-faq" class="hover:text-gray-800 transition">FAQ</a></li>
                        <li><a href="https://www.bicycle-line.com/it/content/12-guida-alle-taglie" class="hover:text-gray-800 transition">Guida alle taglie</a></li>
                        <li><a href="https://www.bicycle-line.com/it/content/14-garanzia" class="hover:text-gray-800 transition">Utilizzo del prodotto e garanzia</a></li>
                        <li><a href="https://www.bicycle-line.com/it/content/13-resi" class="hover:text-gray-800 transition">Resi</a></li>
                    </ul>
                </div>

                <!-- NOTE LEGALI + CONTACT US -->
                <div class="col-span-1">
                    <h3 class="font-bold text-gray-800 mb-3">NOTE LEGALI</h3>
                    <ul class="space-y-1">
                        <li><a href="https://www.bicycle-line.com/it/content/15-privacy-policy" class="hover:text-gray-800 transition">Privacy Policy</a></li>
                        <li><a href="https://www.bicycle-line.com/it/content/16-cookie-policy" class="hover:text-gray-800 transition">Cookie policy</a></li>
                        <li><a href="https://www.bicycle-line.com/it/content/17-termini-e-condizioni" class="hover:text-gray-800 transition">Termini e condizioni</a></li>
                    </ul>

                    <h3 class="font-bold text-gray-800 mb-3 mt-4">CONTATTACI</h3>
                    <ul class="space-y-1 text-xs">
                        <li class="font-semibold">Bicycle Line - VAT 02027450267</li>
                        <li>Via Ferrara, 2-4 31030 Dosson di Casier</li>
                        <li>Treviso - Italia</li>
                        <li>+39 0422 490156</li>
                        <li>custom@bicycle-line.com</li>
                    </ul>
                </div>
            </div>

            <!-- Bottom Bar -->
            <div class="border-t border-gray-400 mt-6 pt-4 text-center text-xs text-gray-600">
                &copy; 2024 Bicycle Line. Tutti i diritti riservati.
            </div>
        </div>
    </footer>
'@

# JavaScript for mobile menu functionality
$mobileMenuJS = @'
    <script>
        // Mobile menu toggle
        document.getElementById('mobile-menu-btn').addEventListener('click', function() {
            const menu = document.getElementById('mobile-menu');
            if (menu.classList.contains('hidden')) {
                menu.classList.remove('hidden');
                menu.classList.add('block');
            } else {
                menu.classList.remove('block');
                menu.classList.add('hidden');
            }
        });

        // Language dropdown toggle
        function toggleLanguageMenu(button) {
            const dropdown = button.nextElementSibling;
            if (dropdown.classList.contains('hidden')) {
                // Close all other dropdowns
                document.querySelectorAll('#language-dropdown').forEach(d => {
                    if (d !== dropdown) d.classList.add('hidden');
                });
                dropdown.classList.remove('hidden');
            } else {
                dropdown.classList.add('hidden');
            }
        }

        // Close dropdown when clicking outside
        document.addEventListener('click', function(event) {
            const dropdowns = document.querySelectorAll('#language-dropdown');
            const buttons = document.querySelectorAll('#language-toggle');
            
            let isClickInside = false;
            buttons.forEach(button => {
                if (button.contains(event.target)) {
                    isClickInside = true;
                }
            });
            
            if (!isClickInside) {
                dropdowns.forEach(dropdown => {
                    dropdown.classList.add('hidden');
                });
            }
        });
    </script>
'@

# Get all product HTML files
$productFiles = Get-ChildItem -Path "*.html" -Include "prodotto-*.html"

foreach ($file in $productFiles) {
    Write-Host "Updating $($file.Name)..."
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    # Remove color and size selection sections
    $content = $content -replace '(?s)<!-- Color Selection -->.*?<!-- Size Selection -->.*?(?=<div class="space-y-6">\s*<div class="flex items-center justify-between">\s*<h3 class="text-sm font-semibold text-gray-900 uppercase tracking-wide">QUANTITÀ</h3>)', ''
    $content = $content -replace '(?s)<!-- Model Info -->.*?<div class="text-xs text-gray-500 space-y-2">.*?</div>\s*</div>\s*</div>\s*</div>', ''
    
    # Update navigation
    $content = $content -replace '(?s)<nav class=".*?</nav>', $navHTML
    
    # Update footer
    $content = $content -replace '(?s)<footer class=".*?</footer>', $footerHTML
    
    # Add mobile menu JavaScript just before closing body tag
    if ($content -notmatch $([regex]::Escape($mobileMenuJS))) {
        $content = $content -replace '(?s)(</body>)', "$mobileMenuJS`n`$1"
    }
    
    # Save the updated content
    $content | Set-Content -Path $file.FullName -Encoding UTF8 -NoNewline
}

Write-Host "All product pages have been updated successfully!" -ForegroundColor Green
