Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0826324700
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 11:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144593; cv=none; b=LD0gsUyF+LSwdlfqVj7uXAmagd2wWLhZoVId9wFC1bAt49dfUS9FoG+XqSCR0TklrNJUKC6Dx7C9SQU0lKJuUmkYHpR1gXfWbHwojhXsurcD/2ZEBX/DOaqIWYgtQ+a22sJE60rGEczUbCvks89Or+TGMev0LmVB/irzWwZ6hQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144593; c=relaxed/simple;
	bh=oGbuUqS2jxVUU4XMsigTRyHeJjXOinYBUJLPzNiDMdw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d3Uh1yxALNCNsprv2VIP6WkXxvO8IxO2PomtiQ0dQrqT6/dWrpTKQv2IqLrtWgPujzDRXe+RA4MjOmna6T+7XPrRYawS6iWf0aodqbawEtJyi/LAfnemE1mrc3WBYtblzznx1NYJ+T9tFgthaYCbVKLygaCwPg1LGyN8+1kesu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BS67V4GV; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BS67V4GV"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477b8a667bcso20093335e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 03:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766144589; x=1766749389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HgOuhXFb6asuFtmyA1DS3ttJfuOKyeiapeN5mpH9fMU=;
        b=BS67V4GVYc9tfYoAUrAjlb80QNHYIgmU02OAfEeaGagy3YmZuDQg5ZKdufwoiJa5Lb
         U5pvAX4GV+5twYJgl9hR+RTwjlAD2mqqU/3z8HoBAElGDNwwkvnS9u+/Mr1Iyx+oRW9B
         XmZNj6PtZg8op39SoRZCKxa3VqILhOIMj1++QZ458IXIKt7allv+56m5QLQDiK6N8pDx
         cwGYQaycXg+C4kjBEXWIWntNpNlRjlUnDtvi0GYbzY0Hot9QuTQpuOTqq/Li366NUFq8
         dYMqGQRbHF0rvKy7DSopOcfgbH7OiRM5LuGgQCGKzvQ6NolcMpmvA5kLc1/NNdMTSCu5
         5Cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144589; x=1766749389;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HgOuhXFb6asuFtmyA1DS3ttJfuOKyeiapeN5mpH9fMU=;
        b=diuvS4ww7R3ceecSIJXGs6BHfamw7KOfI21SN5tC0ir2YYikURl0AYHRqUvbjAwZxm
         TfV+YKuLJMCmR+OOKom/7lfSMw6jJcHImwpD4Fs3iCXHkbr4qDt50wVovLeO30auFNBN
         uOaYlb1wjRSgtt7SV94v4JJm0NQCQSXj+eyf7sZl4eWmregopzd7cyHOnmMvmIQ1yI7z
         aukmrublIqhwbRCL5scJ4779kHUtUfchARLVYJWNdzIPsUpbiyAW9iZJpi93xFSyug0Z
         kS3P+6Kqhr6HGRjk8WA65lg21H6/ly4GJuDaOlMmwWtIKIMwrm4+0d7iwXutUJXzYmYg
         3QLw==
X-Forwarded-Encrypted: i=1; AJvYcCUlgrDPFy6/JIfWNwUwNgUNGo5CcNm3gH1h4XcHLdQrrDJZYYzT+yXGL72jaz+AO8tl3pT/wUcCo0j9r1Qe4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBXgBtI4jLS9dUYCKrUOHfz8XGA4Qvdb1mArrI4YZW32AVrQxf
	wrJMdHHctTKdV+9zuEzI/4zSrbPei3C8FXvRp4oqfj4wkabvbA6qqM0xdf9KFR0PENiHYjE99/2
	CxeIANHSmsXmA70wFig==
X-Google-Smtp-Source: AGHT+IHprtxZfJiX2ZTaI0JdAojBb71DA2tCdz167jCwg+T/Tn5dVzLQg5Aj76IcKhmIc5GQV60E6z/fc8k1Pj0=
X-Received: from wmoo20.prod.google.com ([2002:a05:600d:114:b0:47a:9f70:c329])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524f:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-47d19594b2emr19835145e9.20.1766144588812;
 Fri, 19 Dec 2025 03:43:08 -0800 (PST)
Date: Fri, 19 Dec 2025 11:43:07 +0000
In-Reply-To: <63063977-BA16-4F00-AFBA-8DD6409902E1@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251219-io-pgtable-v4-1-68aaa7a40380@google.com> <63063977-BA16-4F00-AFBA-8DD6409902E1@collabora.com>
Message-ID: <aUU6SwJjch1R56t3@google.com>
Subject: Re: [PATCH v4] io: add io_pgtable abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 08:04:17AM -0300, Daniel Almeida wrote:
> Hi Alice,
>=20
> > On 19 Dec 2025, at 07:50, Alice Ryhl <aliceryhl@google.com> wrote:
> >=20
> > From: Asahi Lina <lina+kernel@asahilina.net>
> >=20
> > This will be used by the Tyr driver to create and modify the page table
> > of each address space on the GPU. Each time a mapping gets created or
> > removed by userspace, Tyr will call into GPUVM, which will figure out
> > which calls to map_pages and unmap_pages are required to map the data i=
n
> > question in the page table so that the GPU may access those pages when
> > using that address space.
> >=20
> > The Rust type wraps the struct using a raw pointer rather than the usua=
l
> > Opaque+ARef approach because Opaque+ARef requires the target type to be
> > refcounted.
> >=20
> > Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> > Acked-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>

> > +/// An io page table using a specific format.
> > +///
> > +/// # Invariants
> > +///
> > +/// The pointer references a valid io page table.
> > +pub struct IoPageTable<F: IoPageTableFmt> {
> > +    ptr: NonNull<bindings::io_pgtable_ops>,
> > +    _marker: PhantomData<F>,
> > +}
> > +
> > +// SAFETY: `struct io_pgtable_ops` is not restricted to a single threa=
d.
> > +unsafe impl<F: IoPageTableFmt> Send for IoPageTable<F> {}
> > +// SAFETY: `struct io_pgtable_ops` may be accessed concurrently.
> > +unsafe impl<F: IoPageTableFmt> Sync for IoPageTable<F> {}
> > +
> > +/// The format used by this page table.
> > +pub trait IoPageTableFmt: 'static {
> > +    /// The value representing this format.
> > +    const FORMAT: io_pgtable_fmt;
> > +}
> > +
> > +impl<F: IoPageTableFmt> IoPageTable<F> {
>=20
> I don=E2=80=99t see a reason to keep struct Foo and impl Foo separate.
>=20
> IMHO, these should always be together, as the first thing one wants
> to read after a type declaration is its implementation.

I thought it was pretty natural like this. First we describe the page
table, then we say it's thread safe, then we describe that a page table
must specify a FORMAT, then we describe that it has a constructor,
then we say you can map pages, etc. etc.

> > +    /// Create a new `IoPageTable` as a device resource.
> > +    #[inline]
> > +    pub fn new(
> > +        dev: &Device<Bound>,
> > +        config: Config,
> > +    ) -> impl PinInit<Devres<IoPageTable<F>>, Error> + '_ {
> > +        // SAFETY: Devres ensures that the value is dropped during dev=
ice unbind.
> > +        Devres::new(dev, unsafe { Self::new_raw(dev, config) })
> > +    }
> > +
> > +    /// Create a new `IoPageTable`.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// If successful, then the returned value must be dropped before =
the device is unbound.
> > +    #[inline]
> > +    pub unsafe fn new_raw(dev: &Device<Bound>, config: Config) -> Resu=
lt<IoPageTable<F>> {
> > +        let mut raw_cfg =3D bindings::io_pgtable_cfg {
> > +            quirks: config.quirks,
> > +            pgsize_bitmap: config.pgsize_bitmap,
> > +            ias: config.ias,
> > +            oas: config.oas,
> > +            coherent_walk: config.coherent_walk,
> > +            tlb: &raw const NOOP_FLUSH_OPS,
> > +            iommu_dev: dev.as_raw(),
> > +            // SAFETY: All zeroes is a valid value for `struct io_pgta=
ble_cfg`.
> > +            ..unsafe { core::mem::zeroed() }
> > +        };
> > +
> > +        // SAFETY:
> > +        // * The raw_cfg pointer is valid for the duration of this cal=
l.
> > +        // * The provided `FLUSH_OPS` contains valid function pointers=
 that accept a null pointer
> > +        //   as cookie.
> > +        // * The caller ensures that the io pgtable does not outlive t=
he device.
>=20
> We should probably tailor the sentence above for Devres?

Maybe "does not outlive device unbind" is better worded, but not sure
what you're looking for with Devres tailoring.

> > +        let ops =3D unsafe {
> > +            bindings::alloc_io_pgtable_ops(F::FORMAT, &mut raw_cfg, co=
re::ptr::null_mut())
> > +        };
>=20
> I=E2=80=99d add a blank here.
>=20
> > +impl<F: IoPageTableFmt> Drop for IoPageTable<F> {
> > +    fn drop(&mut self) {
> > +        // SAFETY: The caller of `ttbr` promised that the page table i=
s not live when this
> > +        // destructor runs.
>=20
>=20
> Not sure I understand this sentence. Perhaps we should remove the word =
=E2=80=9Cttbr=E2=80=9D from here? ttbr is a register.

ttbr is a method defined below with a safety requirement.

Alice
