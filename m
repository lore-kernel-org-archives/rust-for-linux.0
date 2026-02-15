Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99579221265
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771164705; cv=pass; b=OR9cYa2+LW+lzbt2iRE8myOE8BuzAVSZsbZBew3431aFoRHmO2TyRTX8skW+G5dvYBQ/In3EkKwWGg96t2bkgXV5i/yOIgRqt9WrWpi7apJhmAGrAkE07mKl0vqgysdBClVYtahDxVyoiRa1KbEVH3tKAVtRxISWfM1UT5REz1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771164705; c=relaxed/simple;
	bh=IS67sc4Ha9dtdSU+DoGA1J2xownlpl0HA1i2nBo07Do=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iDjjHvQmYFvFr8ZYwZYfWrC9wwbTkzfmj5Gc7ppEcUGc6HbUPG0KrXfmJlIigFcJ5WoPnk5rDZxWPOUPo1EkiFHq/INf0EG1TcfFp9u02rqTuzv4PHlrwPw+5+x9Fv/ImzEa++OoK7d2lfOiIonZ1NB/f4a1SBrMa3FX2hoP7SA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6VG1AAL; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6VG1AAL"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bab709f867so118334eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 06:11:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771164704; cv=none;
        d=google.com; s=arc-20240605;
        b=d+q7/cWpAXe3+sB4u534n3ezkXQsrcJxtUI/o0YqaW+as2J7emNSkhyvDXimaclotd
         FgEsj0Pn1fiYWgc7ytB396tmNFCQZPuVbL6z+GNg84Z2fieQfys9D30n44g9Lu8HyMgH
         /c02uKuA54Stu6YoaKE99tzAZbbqC0LqXAhpKeebxaBRGDf7FrbG+B7kwHctPnkT8gAS
         /8eiPuIVSI+mgUhbKYf8N0sCPyC6pK5PGxgxp0O9XZqhCZ3FxIWSG551aD3zDHOiHsH4
         gLg/CRFog73t8JzpkT1gyb5e0DbCzthIkpHSslZd+wflZUEblNPEp7JRjA3SDpEuV41l
         xsag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lmAu+Za+Ffpbk5WZHW0bF6Gwlmx16jAYsYG2pCm96Tk=;
        fh=rJMxbSU5zbm2F6oGBExoJIeXNgdxtsuCHXstJMgNyzw=;
        b=BR6abMlJy0x6mxRAh1nl670clStDZVBcU14lj5mbEnYK634HmFl1+31X98afN37qaM
         ZZgJf0TJpCRYcHgKnb6U5VXpmvqVMALzd8oXGI6wrx723rnbhbP0QPdaOEiuvA/0UAUj
         FWRWznpIKnHYe1ACzX0/A+dnJW9hkNJqVhFpsDVlDtZHwjb2I0wbiZ06IsmEwCE/fFuB
         rbKrWvdcnQEX3dH/1hJEIg1Ov/pRFN67fpAol1lrbZOckx++DelOXPCqkD415gaABN0F
         5TxUA3MnQLDg7lDoXqS4oO/N0lVw/6yN8Xbb8+a9R0YbWZ8doRludsSaBjXQ4LrgcjWS
         GzDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771164704; x=1771769504; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lmAu+Za+Ffpbk5WZHW0bF6Gwlmx16jAYsYG2pCm96Tk=;
        b=V6VG1AAL/WR0gifhVmdJpLYLkwCMeAM1l5parGTPYr2nLFFpCIE/a8AIMC38McGez3
         iRsufDna4Ypab/2gw5qgA+FNHVvIQfleUCxIwTx8shSTYTGYUNs7LG1vUAglyEg6HyuH
         xh11EttFv5sbj20frQ6uUuDfujLDicmD0rCej5/x6RFvNLvvUB7Vp//5iYs/XyzZzoOB
         BRlr5RwuXG7DCuSS+hbyy3wEmlF/4b8Cgo3ogtqcLHxn5u3MQpPH7QAPPyJM+zWJC5PW
         qkPp5EBlkvrsNj54Ujps/jRe+GgpMy7ZjfN8whbtzN8mZw0ooFEyjSqGHKLDQrsRbhGL
         KewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771164704; x=1771769504;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmAu+Za+Ffpbk5WZHW0bF6Gwlmx16jAYsYG2pCm96Tk=;
        b=WM/TYICGCN8JkCugORNZTfzruJDYIHyAPXDhmQxD+0Z/kQjVcMXfuEGyvdpvy0sd3R
         FPy1BCbXZOgqwfMoc/zX9Z986utkryTkCsGOx9LcQAHHe54ToWXv6HNN83MZwmRxBJCa
         VrvxdTKWfy+SSOxpuo6bdM+KHciG+OIqEwfDFSEekL3P9AZ2GBgdxg9VOTGg1+5vE5hH
         xbjtwtw4cyWR0+UKBVoyYPcF/2Z6bs5lan3nKDK2p1tYDKZoL1ut+de6F/bsRbx5PyMO
         KwSGzEaaqqbD7VtyiGTJDrR6e3urs56hyZT6e/+XeJL806+hW8pGZqUXQYqh4U0JGfpB
         vTeA==
X-Forwarded-Encrypted: i=1; AJvYcCW2qLsmw4nj6ypV58OID+X86daQaM0aJnFFZ4l3VTBMoyM2hWKQeVgledyvZp1lT8wY7DzMiLFgW1R705WP8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpWf80rSKjIbg7nwDH2aYks8qDqNGWkDnCDi+bAtFPITMQK7TQ
	XVUTUrGZ/nFnAxOMduDEiwB8RrfNi2ICl24OCiRzzPsZ8SuiKg2eHZ342rQ8v/c62m1/3fkG4eg
	ahf7dsxmAIphZyfD361g0UERIozlrMQI=
X-Gm-Gg: AZuq6aKdmKq7gGKQLw6kWLS+d5I6TDYukklU1vmwHmoVC0GozKRt0ebvzJN5YA8py6x
	CKRSYwQDfb/y5AYDfC5B7xEYDr8QYSu7UJKAxMk2nAiYv+GaCzCHZcNwcuafUap6UIu2mxT9GlL
	yW9CDNcy8tn+upjq5ftGyfVYU38N/ffynrZK+oJdc/BkkZmlQYqYyuGXb9lE0JBMRbhkOOWbAHA
	vRPArZSOeGEy5w+zsd/X5s1zffm0NVAE2iwp2Ot7UpfO4TX/5UmPWPjyOfDmusw/OBb0eVyCyz+
	9P5s3hK9a4mktOsWd4WECeupeYFdB94tev1SWNzwc1SmpTYhDHCJEUOwV5qmrW1xPdPAei/FXK8
	6QWO84hDKOJKBFgYzki1I1+LO
X-Received: by 2002:a05:7300:bc0e:b0:2ba:b16f:8092 with SMTP id
 5a478bee46e88-2bab9ec5ef6mr1638797eec.0.1771164703649; Sun, 15 Feb 2026
 06:11:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Feb 2026 15:11:31 +0100
X-Gm-Features: AaiRm51kWsntpYAMki_wBOn4FdlRNmJALQ-XrmQQ5z16DZEm77O5QapQ1SrWrNI
Message-ID: <CANiq72n3qPsoy2u1KxfyV4ZCjJyDZLkK-54i7EesTH=TE9h1jw@mail.gmail.com>
Subject: Consider backporting rustdoc fixes for 6.18.y
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	David Gow <davidgow@google.com>
Cc: stable@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-pci@vger.kernel.org, driver-core@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg, Sasha, David,

I have been seeing these warnings (errors with `WERROR=y`) in stable
6.18 UML + Rust on the `rustdoc` target [1].

Unless David (who works around UML + Rust) or the different
maintainers (Cc'd) have a concern, please consider backporting:

  a9a42f0754b6 ("rust: device: fix broken intra-doc links")
  32cb3840386f ("rust: dma: fix broken intra-doc links")
  4c9f6a782f60 ("rust: driver: fix broken intra-doc links to example
driver types")

They had Fixes tags, but not Cc: stable tags.

I hope that helps & thanks!

Cheers,
Miguel

[1]

    error: unresolved link to `kernel::pci::Device`
       --> rust/kernel/device.rs:158:22
        |
    158 | /// [`pci::Device`]: kernel::pci::Device
        |                      ^^^^^^^^^^^^^^^^^^^ no item named `pci`
in module `kernel`
        |
        = note: `-D rustdoc::broken-intra-doc-links` implied by `-D warnings`
        = help: to override `-D warnings` add
`#[allow(rustdoc::broken_intra_doc_links)]`

    error: unresolved link to `::kernel::pci::Device`
      --> rust/kernel/dma.rs:29:70
       |
    29 | /// where the underlying bus is DMA capable, such as
[`pci::Device`](::kernel::pci::Device) or
       |
       ^^^^^^^^^^^^^^^^^^^^^ no item named `pci` in module `kernel`

    error: unresolved link to `kernel::auxiliary::Driver`
      --> rust/kernel/driver.rs:82:28
       |
    82 | //! [`auxiliary::Driver`]: kernel::auxiliary::Driver
       |                            ^^^^^^^^^^^^^^^^^^^^^^^^^ no item
named `auxiliary` in module `kernel`

    error: unresolved link to `kernel::pci::Driver`
      --> rust/kernel/driver.rs:90:22
       |
    90 | //! [`pci::Driver`]: kernel::pci::Driver
       |                      ^^^^^^^^^^^^^^^^^^^ no item named `pci`
in module `kernel`
