Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECE118FDAA
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Dec 2024 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733498744; cv=none; b=WXiebyeq5iADjayjVSsdi3HcaUStjV+uae2LbBqSSXjGvWwJUKONkDIS8CcmHJYkohsM0Y7ZhfAT3Y5eo7T8Kt3mJ2/xP6krwvf+MIzpABnvDVijDHHfpo59jD8L9KW46rZxfRnrvlDTttSGduW0NTppVAvmCAXlAbq3j/o9t1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733498744; c=relaxed/simple;
	bh=YtRCwn0L0reKz/PCsHk5nYbtcK1nUJk/nFphVP0N18Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGMv44UF+YuegWgcM8zC7bl/Fqap3aVt7iXd2CVAEI1wIhRpoHCJl5GuvF0vVmMuOYpbalc3GJvCsQOPe6pLaBUaXbW57ix1p8P8qCSya6c71j69LvlJrRpVoWN+BaYmamV4pN1Pjp7eHvGybXOWolXIINIVV0dnWUdMDPMNv3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W+Hd4VsO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W+Hd4VsO"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e27c75f4so1723519f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Dec 2024 07:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733498740; x=1734103540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUl66/2q9Es7IH83i2VHQcZCXL2FkKLSft77+kwSp+4=;
        b=W+Hd4VsO8QYMsHWI6lgX0bOf9MvToZO1wmKypyeyzqNlGIU5wPpkE6/mRL3zhqJrEX
         vq1OPjZvD59KBakJvYfEGD0S82DHYSA3L9qblK3VYtrxnkYNkY5bXWudEYxgnDIzKTj7
         y4OwiHR3NL8r8zfFDlZY1WzKXOKjBtSkfcsQ/dlWdjGXghZSJqG4RRkOk+aps7rk18pH
         g0RRAvENYeaMxTsWMTYb4lI5R5oobOaXND/GT4lWv66K/Df3FuAggmcPb5d2V7HcILEQ
         AdbFFPX0y7B0DrF3bCfNQ0T7swqEQrSprGgV2noVfFfXOXnCq+5QIRMOgvbeeymwfqJ9
         iG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733498740; x=1734103540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUl66/2q9Es7IH83i2VHQcZCXL2FkKLSft77+kwSp+4=;
        b=ci6tzBH6l9E6+jIoEt453PGQ/J37qr1V8OLADxeu54Z1kfLPZDgJQE8M17BTNcOYyn
         lRB2OIfdPQqfGtcS4u3yUZi4fbSx771XTvPpH4UBHNJROgdnxTh2y5cvDWUR9CBpFvPE
         pQbCrq9K1u7v3L6EvYHyO1rElm4gF/lbQ14gMttFEmintM47w8Zd8zgUugAN7uxksinh
         EQc3bStqeKLK6AZWWfK1acFPDfvCL4Ba2f0FXoTAfffc5HXoa3UmLvMmU5RlCZwj+vV4
         E3i3j82GqInqI62TK5DbtbJn9FaSFMZ6UBF9mYVtlk98+HU0YTiIOBZkiqud/rfD52ao
         0LVA==
X-Forwarded-Encrypted: i=1; AJvYcCVwaATIHms1pBMNnrep1OqYdwMlyakciBstUKSRclDWrDn/q7d7FHbfI4xvX21BPbx0iLmcsmTD65ctruy8Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUcGksx8qAg6dOtr2viP06VQgIeoGZyzM6eIideLi/B+UjV/fW
	r1Bmf6EgurUVlyIc1CTqf7HdqvsIRjec06dEzVDjZeZlk7gsW5KkBCRfSOnDVzFrbZd/NAsqsbY
	3UOaLJTN2Gl2gNsJnyGgG18hU/vQX7ITesUlO
X-Gm-Gg: ASbGncsGG6eVNx9ViPcyFTTh7mwRuaw/Yss5gTpa5QoG3obpFspfcPUFsjl1rOZkn1P
	kL8J2czcf8KRIJujZelaHZU17wOAJTAmy
X-Google-Smtp-Source: AGHT+IFYizkoJZbVBGz6vm2wzIGh1sKlEnG59vyrJhpEUKD4My3ZUK6cpeBmwJvlu/MBEgYOtQCHyJ9kZroLKgAnFK0=
X-Received: by 2002:a05:6000:1886:b0:386:3327:9d07 with SMTP id
 ffacd0b85a97d-38633279daemr57136f8f.54.1733498740410; Fri, 06 Dec 2024
 07:25:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205141533.111830-1-dakr@kernel.org> <20241205141533.111830-9-dakr@kernel.org>
In-Reply-To: <20241205141533.111830-9-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Dec 2024 16:25:28 +0100
Message-ID: <CAH5fLggWOkut0O+28NVYBSF2CTpHXe9Thb3rhXoRZo5e9zFjzw@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] rust: pci: add basic PCI device / driver abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	tmgross@umich.edu, a.hindborg@samsung.com, airlied@gmail.com, 
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org, 
	daniel.almeida@collabora.com, saravanak@google.com, dirk.behme@de.bosch.com, 
	j@jannau.net, fabien.parent@linaro.org, chrisi.schrefl@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 3:16=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Implement the basic PCI abstractions required to write a basic PCI
> driver. This includes the following data structures:
>
> The `pci::Driver` trait represents the interface to the driver and
> provides `pci::Driver::probe` for the driver to implement.
>
> The `pci::Device` abstraction represents a `struct pci_dev` and provides
> abstractions for common functions, such as `pci::Device::set_master`.
>
> In order to provide the PCI specific parts to a generic
> `driver::Registration` the `driver::RegistrationOps` trait is implemented
> by `pci::Adapter`.
>
> `pci::DeviceId` implements PCI device IDs based on the generic
> `device_id::RawDevceId` abstraction.
>
> Co-developed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> +impl<T: Driver + 'static> Adapter<T> {
> +    extern "C" fn probe_callback(
> +        pdev: *mut bindings::pci_dev,
> +        id: *const bindings::pci_device_id,
> +    ) -> core::ffi::c_int {
> +        // SAFETY: The PCI bus only ever calls the probe callback with a=
 valid pointer to a
> +        // `struct pci_dev`.
> +        let dev =3D unsafe { device::Device::get_device(&mut (*pdev).dev=
) };

It shouldn't be necessary to increment the refcount here.

Also, the mutable reference is illegal because it references a C type
without a Opaque wrapper. Please use the addr_of_mut! macro instead of
a mutable reference.

Alice
