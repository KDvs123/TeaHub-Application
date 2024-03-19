import React from "react";

const Footer = () => {
  return (
    <footer className="bg-green-100 text-black py-8">
      <div className="container mx-auto px-4 md:px-8 lg:px-12">
        <div className="flex flex-wrap justify-between items-start -mx-4">
          <div className="w-full sm:w-1/2 md:w-1/4 px-4 mb-6 md:mb-0">
            <h5 className="text-xl font-bold mb-4">TeaHub</h5>
          </div>

          <div className="w-full sm:w-1/2 md:w-1/4 px-4 mb-6 md:mb-0">
            <h5 className="text-xl font-bold mb-4">Navigation</h5>
            <ul className="space-y-3">
              <li>
                <a href="/about" className="hover:underline">
                  About TeaHub
                </a>
              </li>
              <li>
                <a href="/terms" className="hover:underline">
                  Terms and conditions
                </a>
              </li>
              <li>
                <a href="/privacy" className="hover:underline">
                  Privacy policy
                </a>
              </li>
            </ul>
          </div>

          <div className="w-full sm:w-1/2 md:w-1/4 px-4 mb-6 md:mb-0">
            <h5 className="text-xl font-bold mb-4">Contact</h5>
            <ul className="space-y-3">
              <li>
                <a href="/help" className="hover:underline">
                  Help center
                </a>
              </li>
              <li>
                <a href="/support" className="hover:underline">
                  Support
                </a>
              </li>
              <li>
                <a
                  href="mailto:vihangasupasan2001@gmail.com"
                  className="hover:underline"
                >
                  Send E-mail
                </a>
              </li>
            </ul>
          </div>

          <div className="w-full sm:w-1/2 md:w-1/4 px-4">
            <h5 className="text-xl font-bold mb-4">Follow us</h5>
            <ul className="space-y-3">
              <li>
                <a href="https://instagram.com" className="hover:underline">
                  Instagram
                </a>
              </li>
              <li>
                <a href="https://facebook.com" className="hover:underline">
                  Facebook
                </a>
              </li>
            </ul>
          </div>
        </div>

        <div className="text-center text-sm mt-8 md:mt-16">
          © 2024 TeaHub. All rights reserved.
        </div>
      </div>
    </footer>
  );
};

export default Footer;
