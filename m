Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63697326D75
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 22:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763590771; cv=none; b=mslqzXgKBPqVEIxprW8NN7UrewT4aLnwr65mI4R6VhT2RTHoFos3gw9bXWqMwUxRneHlc6AhRV4UzgHNxPgWu5UO7e6JjsDRWcUcL/KFx19533/Ouhk+aUqJBhgsoBhxsR1T2JmfA1AtnE8+V9iSNb3uymK759Yj7QnA4xq/k3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763590771; c=relaxed/simple;
	bh=ePuew1JCM1Hs1e6ZIWmT70f+aea4BDiTcwCKTX9QAMU=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=rkEWlUKsWMYs8/6e6s19YIATEMN0yZFGxB4fan33uGESgjLZ7y41Cxxha9VdiQ9+CPnLZcb9k9/j//p0zBZFTcC9TyTgLm9gOvenzo6J1N1U7jMsyT8AtLm44gp5IRiH5JIcP6AywtDW54MOA8voNW4Z/corI0aUWkECAhRSe+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YypFePJk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YypFePJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763590767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sRACUSt64wUiVLTpoLMSIYgwAJ0MY3voBS0pEwO7IGQ=;
	b=YypFePJkq/uwUBvZMzVD9DgjdhRJkuxAnMZjmlo78XbChw2Byvbo0GeYmFIPGmIVATFZ/v
	eMvJUviaZIs/iNcb9/EboQQlzJHsVPkKPP2jtbXj/ldgwDnoVdmOm+ZbuvCAUwdw7Xfvpm
	oXZ8fdowDAXHtmStxI7YmgflPI+isUw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-oBCc-CTYMNKW_KfgGWXLFw-1; Wed, 19 Nov 2025 17:19:26 -0500
X-MC-Unique: oBCc-CTYMNKW_KfgGWXLFw-1
X-Mimecast-MFC-AGG-ID: oBCc-CTYMNKW_KfgGWXLFw_1763590765
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-89eb8ee2a79so137212985a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 14:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763590765; x=1764195565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sRACUSt64wUiVLTpoLMSIYgwAJ0MY3voBS0pEwO7IGQ=;
        b=mZQT8ik0HO4zxEHAlGfHDwIIrmn/b3uiWw0u7MdUHBInXCwrDRk54/OOyPRmVvNN2C
         X/QVVKgiNM6wpesswHlyg/+IjBeyg2P09yydrxFdABpMj4eHIyIwYOASPE5AyG/QcZAi
         yWNg0jzH+j5N7g0ZvaV4jycSTfwLRvk6dRDVedtDKqo1+VAnoViDf624qusABTo/ZUqI
         pJ1B3X5Bpm5bWzDRFjatVWWX5iCFarhbomwFt6RWu/tbV1LMX3YStjee+1t7LUa+lqgf
         +X0oNK3KqosldXfivrb0CES2W07F/txQ40pV3gJEcT23gHOuYX3RDFwFEBuNet7d2Gtd
         m/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5t4TGIIzIwveGQqlz6tquSdG1g7dwZ/DT8F4dMN2nmYr8HrI6kFd8mvNOcKj+rLL0OS9v/ZQZtlzycA2Pkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4h7sge7obwbuQaqk+pkUKQMwUR+OxQs65gqhs+1/b2wKEE63E
	vQyRyox4ZAV6HigOA8sB+TyfdfK5AF05Dtbil1hSAbXQacJRUqWQOfg14DKmjsUxqeGWFK5JiQj
	6gqV8O3uQmgy1PTZ193TVqPpgznUgMgXpDX4mjVXNdW8NXchcKqUeDK06r6rIL8txX6Do
X-Gm-Gg: ASbGnct1ROA6ERsV6b/PyMCqPtgAG0vBGUFckkWUGSYJ0HQTvj8rYfrSg7iTGGJMyDW
	FPyG07G5p0KLLpTXR0ahB0boXdSwBtTbjo0lHr5pBGHuVZEh6B3iA7n0z4AJggR+iQlaI6yev6K
	uUKOOrycuiDFE7fVFGFio82ZXgOF4mgUCQMPD0MMYSwUXGI3rnJ8Zjz3TfYMOqj3/FIlJbyOZI3
	hedGV7v9JQHT8T65xsYyBXu1sPmTtgGn3+KvBno8GGj2bUlK5LxbYTzeeXJt4MOc2fZYZz8lYAf
	P56gBejvqj3qtdxKERcITZDe6nqc0yDVQYssmFcBy0J2tufWlbj/gQZn9wxOeWOoa4ntdCYbg89
	GLXv0uk5lBhsCKg==
X-Received: by 2002:a05:620a:c54:b0:8b2:9765:3a69 with SMTP id af79cd13be357-8b32747f96amr159064985a.68.1763590765323;
        Wed, 19 Nov 2025 14:19:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPsHmN0cQPL5HT5GsktthJovUEqLhZHDaj3qO7Z3zvSReIfEaHAgbYWjYECBY/fX2jHQY1EQ==
X-Received: by 2002:a05:620a:c54:b0:8b2:9765:3a69 with SMTP id af79cd13be357-8b32747f96amr159058585a.68.1763590764685;
        Wed, 19 Nov 2025 14:19:24 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b141:ac00:ca1:dc8c:d6d0:7e87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e447304sm4426866d6.4.2025.11.19.14.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 14:19:24 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Wed, 19 Nov 2025 17:19:10 -0500
Subject: [PATCH 6/8] rust: pci: add bus callback sriov_configure(), to
 control SR-IOV from sysfs
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20251119-rust-pci-sriov-v1-6-883a94599a97@redhat.com>
References: <20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com>
In-Reply-To: <20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>
Cc: linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Peter Colberg <pcolberg@redhat.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NOtX2e_A2xgWC9meS4tZvJN4fLRKUq9-6yihI0bjbzY_1763590765
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add an optional bus callback sriov_configure() to pci::Driver trait,
using the vtable attribute to query if the driver implements the
callback. The callback is invoked when a user-space application
writes the number of VFs to the sysfs file `sriov_numvfs` to
enable SR-IOV, or zero to disable SR-IOV for a PCI device.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 24dda12f6402098a1a323f3b5aae884201b26d89..f9054c52a3bdff2c42273366a4058d943ee5fd76 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -66,6 +66,10 @@ unsafe fn register(
             (*pdrv.get()).probe = Some(Self::probe_callback);
             (*pdrv.get()).remove = Some(Self::remove_callback);
             (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
+            #[cfg(CONFIG_PCI_IOV)]
+            if T::HAS_SRIOV_CONFIGURE {
+                (*pdrv.get()).sriov_configure = Some(Self::sriov_configure_callback);
+            }
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
@@ -118,6 +122,20 @@ extern "C" fn remove_callback(pdev: *mut bindings::pci_dev) {
 
         T::unbind(pdev, data.as_ref());
     }
+
+    #[cfg(CONFIG_PCI_IOV)]
+    extern "C" fn sriov_configure_callback(
+        pdev: *mut bindings::pci_dev,
+        nr_virtfn: c_int,
+    ) -> c_int {
+        // SAFETY: The PCI bus only ever calls the sriov_configure callback with a valid pointer to
+        // a `struct pci_dev`.
+        //
+        // INVARIANT: `pdev` is valid for the duration of `sriov_configure_callback()`.
+        let pdev = unsafe { &*pdev.cast::<Device<device::CoreInternal>>() };
+
+        from_result(|| T::sriov_configure(pdev, nr_virtfn))
+    }
 }
 
 /// Declares a kernel module that exposes a single PCI driver.
@@ -307,6 +325,39 @@ pub trait Driver: Send {
     fn unbind(dev: &Device<device::Core>, this: Pin<&Self>) {
         let _ = (dev, this);
     }
+
+    /// Single Root I/O Virtualization (SR-IOV) configure.
+    ///
+    /// Called when a user-space application enables or disables the SR-IOV capability for a
+    /// [`Device`] by writing the number of Virtual Functions (VF), `nr_virtfn` or zero to the
+    /// sysfs file `sriov_numvfs` for this device. Implementing this callback is optional.
+    ///
+    /// Upon success, this callback must return the number of VFs that were enabled, or zero if
+    /// SR-IOV was disabled.
+    ///
+    /// See [PCI Express I/O Virtualization].
+    ///
+    /// [PCI Express I/O Virtualization]: https://docs.kernel.org/PCI/pci-iov-howto.html
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{device::Core, pci, prelude::*};
+    /// #[cfg(CONFIG_PCI_IOV)]
+    /// fn sriov_configure(dev: &pci::Device<Core>, nr_virtfn: i32) -> Result<i32> {
+    ///     if nr_virtfn == 0 {
+    ///         dev.disable_sriov();
+    ///     } else {
+    ///         dev.enable_sriov(nr_virtfn)?;
+    ///     }
+    ///     Ok(nr_virtfn)
+    /// }
+    /// ```
+    #[cfg(CONFIG_PCI_IOV)]
+    fn sriov_configure(dev: &Device<device::Core>, nr_virtfn: i32) -> Result<i32> {
+        let _ = (dev, nr_virtfn);
+        build_error!(crate::error::VTABLE_DEFAULT_ERROR)
+    }
 }
 
 /// The PCI device representation.

-- 
2.51.1

