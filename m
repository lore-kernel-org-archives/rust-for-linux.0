Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA80B226CFD
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 07:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763449826; cv=none; b=Rz8rAQoV6TPEdrk/BKGqLZsKU5LfjK5luf553dQZA09mAqADDetn4JsPcoRaEVHzQDpAGKyW1aGNgYtDEeMj01kS2yzra0Y9HritEXDPZ5Rup5pJ/tyBs/fi9p/xLJi+8MO8bfe9dLGQyH8ophlxKWEHgfBVJ9SZyfZpDEZV3uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763449826; c=relaxed/simple;
	bh=f5j5GFw7HxcstEUJVmLBwSDuIUBYpwJ18rHcgC1ra14=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=P3R4M4lVKmDwpI4Yl6WK67+vZhnxfG96M4x52s/dwIIaSHS7rPlGHOY/U7w2MBrXsDyXv503mkps/Qje7N2Pz4632RUlwLMKGwO02alze5JiQrNMwFarv02yhEciqoddA657p6EIOPCASfHRPxDRKJ98WD06XFpyvCHFxpG2pfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=Edyp09i3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="Edyp09i3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47774d3536dso41946425e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 23:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1763449821; x=1764054621; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAceOM+tRAzWnWwX4kxnpGfm+OOmQCv4rz9NNAeFe+E=;
        b=Edyp09i30eG5tuasFMtXbm605OC3puVuw3cSKDsffNoc0KAwn3TIDNNfAiquJofRuL
         SSlrXuZZ8La2s7MkHh5ZVBYIzwv6n0MdzkpoX4NJjI4GTybdOURuRMN1s5xccESVPAhJ
         1s+KlL7m15Uwxsw7cK3a2o5fCzILnLmpyeipU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763449821; x=1764054621;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fAceOM+tRAzWnWwX4kxnpGfm+OOmQCv4rz9NNAeFe+E=;
        b=OPOuG3yGFVn66iYqXjkx2dJemty8KhOtFw1/+IyWtCru2x0DcPOJmJvWtFk/vTk3jf
         CkHHuNGZuVbPHrVAIpyzx9iQ2s9iaf6l348hJfCwg7IsYk94sMW6WOuoKEen/QgdNHCL
         ApIQ6kxz4II0pMojkyLhGoDMRf0dLJigT8fuUPi4ytyuKITr9g6SAGR4ys9D6JY/2n29
         1R0bGVQGo9lc03gfnGtG2WRtFgmSsvmp/+DR9yf4dG0MSbe+WiUTATRdAm0AuPRtFSu1
         h1TnumPGbi7U14WcCiaJE0smw8rPNI0k+idqh1rk2LwXPxBgYKpqRWIofQRrqqt+o/mx
         0Y3g==
X-Forwarded-Encrypted: i=1; AJvYcCU0cki8JRGJV+MTUJ4HkJy0PJ195WxGAW0l9DXi1mGhrv/a3sVf44XRv1p+wfxQaX9FENUWYeuovnJPKJEIOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTEBpaSoEFbq+UsgvNFrQxqRG8BCtEHmFn4NeGQrrNSfr7uaVy
	Tog9/BGED+BQ8ccMNRxj8Ls2IifwaLFugqwh3G01dh1TB2fKCcgKD7Bgm924MYGyajk=
X-Gm-Gg: ASbGnctRAluRDdPV51ngz0XKbBNxxckkRX8ip+ehzezH+CmhpgzJtOr8s+2ok2DJ6Mj
	71JoA3o2U0rzPRCdvKOSzkLdCVIXX4B4eVBtc0MfA7jNCVs1umR53OLwU4QKCB8vQbrc7X4P4Pv
	flI+b2npz7Vxi94v8VGgwzu9e4ZgqTORST5qXA0VvgxyF05TeFFgCzzyBBQIIgQn1sAXnzfK/9k
	A6DUy0JQDDNwGo7+uVJQAH4brOXQKOdbLz/boL0kg4+ZX3CfCPKFu8eRpL/kdu5atvZYa4UNACj
	beSqevV+0HnxtID459QF+3CFv4ocx8zxS328ZIxHo5pBwUD/OVSrA/Z0LTZPwvgjaonnvXn6SbT
	//4mG0zD6emRd5nkJfPqwsz9TPJT9pEoewVM59o9NUA3wPf+n8UU3OiLy0zxnTE3KtouVBiHfhc
	3/nC7pQhE98R7P8mleBl7eMK72pJxNdozemsU7TU/hMJ4=
X-Google-Smtp-Source: AGHT+IEf7O+jAeJufGEkmndw/pec203OTiQOQ+ZZ9dHzEQFlHfdRp0A88PhTYJEnYg2XLHVvCn/8WQ==
X-Received: by 2002:a05:600c:204b:b0:477:9a61:fd06 with SMTP id 5b1f17b1804b1-477a94b9b2cmr12366695e9.8.1763449821059;
        Mon, 17 Nov 2025 23:10:21 -0800 (PST)
Received: from smtpclient.apple ([86.125.45.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a972141bsm10865515e9.2.2025.11.17.23.10.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Nov 2025 23:10:20 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: add a function that returns a reference to the IO
 Ports Resource
From: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
In-Reply-To: <9DC413F9-40A8-44D0-9A77-D392D25F1E82@collabora.com>
Date: Tue, 18 Nov 2025 09:10:07 +0200
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 Fiona Behrens <me@kloenk.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D9CBB978-017A-4EE3-84B0-1B93AC4548E9@wyliodrin.com>
References: <20251117163112.22515-1-alexandru.radovici@wyliodrin.com>
 <9DC413F9-40A8-44D0-9A77-D392D25F1E82@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)

Hi Danial,

> On 17 Nov 2025, at 18:58, Daniel Almeida =
<daniel.almeida@collabora.com> wrote:
>=20
> Hi Alexandru,
>=20
>> On 17 Nov 2025, at 13:31, Alexandru Radovici =
<alexandru.radovici@wyliodrin.com> wrote:
>>=20
>> This patch adds a function to `kernel::io::resource` that returns a =
static reference
>> to a `Resource` that represents the IO Ports.
>>=20
>> Without this patch, there does not seem to be any way of getting a
>> reference to a `Resource` of the IO Ports. This prevents anyone =
writing
>> a safe driver in Rust that requires registering IO Ports.
>>=20
>> Examples are drivers for PS/2 keyboard and mouse or any of the
>> QEMU x86 debug console (debugcon) and exit devices (isa-debug-exit).
>>=20
>> The QEMU debug devices are one of the simplest drivers that one can
>> write and are good examples of the Rust Driver API.
>>=20
>> This patch has been inspired by the work at of Daniel Almeida and =
Fiona
>> Behrens on the Asahi Linux branch.
>>=20
>> Co-developed-by: Fiona Behrens <me@kloenk.dev>
>> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Co-developed-by: Alexandru Radovici =
<alexandru.radovici@wyliodrin.com>
>> Signed-off-by: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
>> ---
>> rust/kernel/io/resource.rs | 9 +++++++++
>> 1 file changed, 9 insertions(+)
>>=20
>> diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
>> index bea3ee0ed87b..293b330c3d6d 100644
>> --- a/rust/kernel/io/resource.rs
>> +++ b/rust/kernel/io/resource.rs
>> @@ -18,6 +18,15 @@
>> /// `CONFIG_PHYS_ADDR_T_64BIT`, and it can be a u64 even on 32-bit =
architectures.
>> pub type ResourceSize =3D bindings::phys_addr_t;
>>=20
>> +#[cfg(CONFIG_HAS_IOPORT)]
>> +/// Returns a reference to the global `ioport_resource` variable.
>> +///
>> +/// This function is available only if `CONFIG_HAS_IOPORT` is =
enabled.
>> +pub fn ioport_resource() -> &'static Resource {
>> +    // SAFETY: `bindings::ioport_resoure` has global lifetime and is =
of type `Resource`.
>> +    unsafe { Resource::from_raw(&raw mut bindings::ioport_resource) =
}
>> +}
>> +
>> /// A region allocated from a parent [`Resource`].
>> ///
>> /// # Invariants
>> --=20
>> 2.51.0
>>=20
>=20
> I don=E2=80=99t recall any issues with this. We removed it at the time =
because there were no users.
>=20
> It seems like this is still the case?
Thank you for the quick reply. I am trying to teach Rust for the Linux =
kernel at the university and this seems to me like a chicken and egg =
problem, but I might be
wrong. My understanding is that if there is no real drivers usage, this =
cannot be into the kernel. My concern is that if there is no API for =
this, developers will
just ignore the port reservation or use the unsafe (and possible forget =
to release the prorts).

=46rom the didactical point of view, for someone just starting with =
this, writing these simple QEMU drivers (debugcon and isa-debug-exit) is =
a very good exercise.
What I wanted to avoid is them patching the kernel before they can write =
these drivers.

If we cannot merge this due to the lack of users, could you point me to =
a driver that we could rewrite so that we actually have a user? Or, is =
it ok to add sample
drivers that use it?

Thank you.

Alexandru
>=20
> =E2=80=94 Daniel

