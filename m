Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D42635CBA1
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 02:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762914196; cv=none; b=RJF6UnzxJaMhEx5PBvpfVObZTtSENyHgMf25ELLSOxuGUGifEum6guMTKk0EZ7BZdGzmQlIlYW53Bq1l+DR6nBoisPoSVTkGnnEgOmQ/bVFU2okDLuYSXUel/VnTcdv55VFIkHcDCOGLbxoCwR3zEEWIrELbmYJRfJ+1hgh7Tt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762914196; c=relaxed/simple;
	bh=+1OowVNjO+Sfr7ssnvcjinR8ZIQ2PosBgIvJNtZlEW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1TJrJkyjutUr0WbkDS9LvdtVNq+dSEsJ4hicn+PrHbnY3NyJ0/WQpg0vyPfmeDYey/QsANFhxYulseopumIFTB5eFpqejTvKn5pQrEinWQjY3gDNTcfIdYwKWUkdVQn/Wq9q54IRMlMpztMLYhtU4wN3jLBOvGHnMyRmzLO55M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F57C8L42; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F57C8L42"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b22624bcdaso48228885a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 18:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762914192; x=1763518992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArfzsUXqTUAD1WFQyUE1FBoAIq9waTPdSEHAoPn1Zm4=;
        b=F57C8L42aTVVQgWNDspsI/xE+OGyTLfy1HVOPvhxPx1s+3IFsx0PEblyIaaMVv6vlO
         qgoOv2ESeay19WML2/0LI/j1tMy23naoKagfBumFpGIHj9i3JvmGVEzE3mtTqixWuGDc
         FGpg+JH0PYUIU0NlCj8s2d6YgNUBJL9ykEbfYIoWGU/xUq5zX+0UnDwHd2+ZDzW1N6E5
         cytXM0i1fxVZt1SZpzGcfKTk7RJAqATrJK3913jtoQ4JVWCh8FM8n+y5QLhnhyepqtLM
         ANVvShfpYKTLIEjZ51u/Yp1yaUMhjketz+tMwnf4p207w1z7yxamNGNQ2LaBORPlFQF9
         hM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762914192; x=1763518992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ArfzsUXqTUAD1WFQyUE1FBoAIq9waTPdSEHAoPn1Zm4=;
        b=uPlR0Mpb2h0OhHU8diFqrNZu4ri947pIJZQ4Nu6bAGb+EE/n9ijGH/7cNjOHRDqZQk
         plIUhInTz/lzqGARqJTOYA8LJALh0TcBDTIZDXhMnrpctYHT1cFHS0yAsS8uW9A1O/dA
         ETdmfG9lY76ImgMaGnuadyxYW/LXGHaFchRIhsJSh21IitWspyE29ZLzZy7plQTvWVQd
         NebHZleUfcsbSiuxwszhXnAKCbfh67H67FiIoKicKMhs7D/AcQBts0LqREwAHFSg80Df
         wuMdvl3wx9002TxHpZfdhWqO6ZtzIIatoDGZ3W3jtckYzSsaSAniL6hq3IkSpb3G9MH2
         GxdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX43i0Na7WggenPJtYUrjrMza9PCS0M8hZ07Rv6m4+SqkQgMheSqmAJYKgSZRembB0qpE8jHWZufb3uKKq8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc03SI9C0IF2B3JlWROSGFH7LDiV0rASzk4ZEOKv9esG6zixO0
	dmup4ZsQH56Q/K6liW+Z29/7jYQFEeGIj6txDtaRwmVf2JJxuwvB6vOx
X-Gm-Gg: ASbGncuXKgJ0l+9PCzgcujHN0vv4Sj6RtLC0+c2+NfbOMwADn6w2TVtbCC+mhmNpVdZ
	oJkv393dIrYkeJqCaygn3e8BHXkZnWsLpFsB911Hi06l+qPC13YglyEY417AHObfwQhDXXGCMNQ
	qyTvl9EGnMnIK8vnRGmiAML/3l6T1e7JWdy2rMdeayhIeLDPEJLNIWd4sv4rwvpYOdC8EGprlJU
	645gGrkcrb9fk/G7MZuCNOWKz7fVQgJ9mvbVEx2jZGi9J2ecoDygewvvXi5NbXkSaAVK69268DE
	cufCHcXnDa2jcclub6/JZM2yCMUz66myATJKf8EbVuUx4yx3QoIYkGIlALDYwdwsqLf1KzmQjxI
	C7AQEzKvbKFiOT7AeSTJ0xwTjQkaEGAYvE/d9GIRMfWXP5+JKSgNkrb5A6uTlXQA36ZFq6tJqSd
	e7dJVfjo7eeZ0Zp/Baad1Sdqo7wRoImzj0afxS0bVmxJ4ioCxRXYvnOkRyBdDNZWhWGdx5t4pY5
	3iO
X-Google-Smtp-Source: AGHT+IFebt2vK/J+piLgJTAPcjRA5bX4FnhHdJamZJbn76KvBNGeJ/drT9Ao8uVS00IMQRLPspYjWw==
X-Received: by 2002:a05:620a:c4a:b0:8b1:c886:1c19 with SMTP id af79cd13be357-8b29b77870bmr209321485a.23.1762914192186;
        Tue, 11 Nov 2025 18:23:12 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29a9fe55csm99293985a.43.2025.11.11.18.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 18:23:11 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 52015F40068;
	Tue, 11 Nov 2025 21:23:11 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 11 Nov 2025 21:23:11 -0500
X-ME-Sender: <xms:j-8TaUi9FAnPpKx1nADpjU7n6HsasgZyx2xui_96IzE_42dnmTDGJg>
    <xme:j-8TaVNYtTC7zfaD7n4k4Vxu6n_XX-JCDmAYXV_q1AdTkOeV7LRMICtxQ5RixSZMl
    UPqFoLW4Jc8Xt6qqLNtufLrO7BwJ6SdsSfpaHQ8igiDuZqdaO7liA>
X-ME-Received: <xmr:j-8TaXrvj5oYkuy0BJa4_BSU9jtLOxNR_qrKxI80n8lz-RfukNLf2wnpOSaNlPGZXdPyHOsYj7Y8GFIH-nbrKbHr6jNXvNNE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtddvkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtrodttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeeitdefvefhteeklefgtefhgeelkeefffelvdevhfehueektdevhfettddvteev
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpth
    htoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhi
    tggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdr
    tghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgh
    grrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:j-8Taf4YYRNY4Ut3ENWrMYf00BYZmHjYBGSsVFfR9ErmMrfgz3ud9A>
    <xmx:j-8TadgbQsJrLRQH3PcQRH82eQzkjfXW6FnBeRs4GvfMZfjoUtyCuA>
    <xmx:j-8Tad69Lg1unL8CBoqeYa4Onkp8qPf1IdE4zNorGdWTrSrI-hj1ww>
    <xmx:j-8TaaFm7_cAvHe62IIujPROZu4OZJ3vFtPiXWnLQybf4Er6tT8-rQ>
    <xmx:j-8TaXLDwJ4Hp9PygAJu7pweei-E4KLzmQ3cf9NZnhQyH34l5stm6r98>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Nov 2025 21:23:10 -0500 (EST)
Date: Tue, 11 Nov 2025 18:23:09 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, aliceryhl@google.com, ojeda@kernel.org,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly
 once
Message-ID: <aRPvjQJLdzvxLUpr@tardis.local>
References: <aRIPgOPvi4uhGQcM@tardis.local>
 <20251111.120949.1793896304189618185.fujita.tomonori@gmail.com>
 <aRLG1Ofr5QpJGFaB@tardis.local>
 <20251112.064349.598094996228184902.fujita.tomonori@gmail.com>
 <aRPjNS9jIsyHGAPl@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRPjNS9jIsyHGAPl@tardis.local>

On Tue, Nov 11, 2025 at 05:30:29PM -0800, Boqun Feng wrote:
> On Wed, Nov 12, 2025 at 06:43:49AM +0900, FUJITA Tomonori wrote:
> > On Mon, 10 Nov 2025 21:17:08 -0800
> > Boqun Feng <boqun.feng@gmail.com> wrote:
> > 
> > > On Tue, Nov 11, 2025 at 12:09:49PM +0900, FUJITA Tomonori wrote:
> > >> On Mon, 10 Nov 2025 08:14:56 -0800
> > >> Boqun Feng <boqun.feng@gmail.com> wrote:
> > >> 
> > >> > On Mon, Nov 10, 2025 at 06:21:50PM +0900, FUJITA Tomonori wrote:
> > >> >> On Fri, 7 Nov 2025 09:03:01 +0000
> > >> >> Alice Ryhl <aliceryhl@google.com> wrote:
> > >> >> 
> > >> >> >> That's my point (and probably also Andreas' point), we already has the
> > >> >> >> type `SetOnce` to do this, no need for a `OnceLite` type if not
> > >> >> >> necessary, and the fact that it can be zero'd by debugfs doesn't change
> > >> >> >> it as I explained above.
> > >> >> > 
> > >> >> > The SetOnce type doesn't do the same thing as OnceLite. SetOnce has
> > >> >> > three different states, but OnceLite only needs two. I don't think we
> > >> >> > should be reusing SetOnce here.
> > >> > 
> > >> > I mean 3 states should cover 2 states, right? In this case we only need
> > >> > to support SetOnce<()>, so I think it's fine, see below:
> > >> 
> > >> Yeah, that would remove access to the value member, but I think that
> > >> init member could still be accessed in an unintended way.
> > >> 
> > > 
> > > What an unintended way you mean? Do you have an example?
> > 
> > From my understanding, the init member of SetOnce is designed to be
> > accessed by using atomic operations, only through its methods. If we
> > use SetOnce for OnceLite, however, the init member would be written
> > using non-atomic operations, which is what I referred to as the
> > "unintended way" since I don't believe Andreas intended it to be
> > modified in that manner; i.e., not through its methods or by
> > non-atomic operations.
> > 
> 
> Ok, the "non-atomic operations" seems to be a distraction for me to see
> the real problem ;-) Let's clear things out a bit.
> 
> First of all, data races are not allowed in kernel, but kernel has
> special rules about data races, namely, a few operation should be
> treated as "per-byte atomics" so that they will have defined behaviors.
> This is kinda a gray area, but it's what it is.
> 
> Now for Rust, we shouldn't do what C code did previously that so atomics
> have to be used in OnceLite, but when interacting with C, we can still
> use the special rule of data races in kernel for reasoning, so the
> "non-atomic operations" part in your argument shouldn't affect the
> validity of OnceLite or SetOnce.
> 

Btw, the "non-atomic operations" can be simply "fixed" by the following
diff (only compile tested and I haven't done the "move to kernel::sync"
part).

Regards,
Boqun

--------------------->8
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 8a9a2e732a65..61dc35e49a63 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -361,6 +361,9 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 	__start_once = .;						\
 	*(.data..once)							\
 	__end_once = .;							\
+	__rstart_once = .;						\
+	*(.data..ronce)							\
+	__rend_once = .;							\
 	*(.data..do_once)						\
 	STRUCT_ALIGN();							\
 	*(__tracepoints)						\
diff --git a/rust/kernel/once_lite.rs b/rust/kernel/once_lite.rs
index 44ad5dbdc67e..b94834d2fd29 100644
--- a/rust/kernel/once_lite.rs
+++ b/rust/kernel/once_lite.rs
@@ -48,8 +48,32 @@ pub fn call_once<F>(&self, f: F) -> bool
         f();
         true
     }
+
+    /// Reset so that `call_once()` can call the function again.
+    pub fn reset(&self) {
+        self.0.store(State::Incomplete, Relaxed);
+    }
 }
 
+/// # Safety
+///
+/// This can be only called with the current `start` and `end` range for `pr_*_once!()`.
+#[no_mangle]
+pub unsafe extern "C" fn reset_rust_call_once(start: *mut ffi::c_void, end: *mut ffi::c_void)
+{
+    let start = start.cast::<OnceLite>();
+    let end = end.cast::<OnceLite>();
+    // SAFETY: Function safety requirement
+    let offset = unsafe { end.offset_from_unsigned(start) };
+
+    if offset != 0 {
+    // SAFETY: Function safety requirement
+        let onces = unsafe { core::slice::from_raw_parts(start, offset) };
+        for once in onces {
+            once.reset();
+        }
+    }
+}
 /// Run the given function exactly once.
 ///
 /// This is equivalent to the kernel's `DO_ONCE_LITE` macro.
@@ -64,7 +88,7 @@ pub fn call_once<F>(&self, f: F) -> bool
 #[macro_export]
 macro_rules! do_once_lite {
     ($e:expr) => {{
-        #[link_section = ".data..once"]
+        #[link_section = ".data..ronce"]
         static ONCE: $crate::once_lite::OnceLite = $crate::once_lite::OnceLite::new();
         ONCE.call_once($e)
     }};
