Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A260930F52B
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 23:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767224529; cv=none; b=Rlm1ymk27P+O4IdFhZSraSJYSCLQkR6L+Xte1NaD7Wma3Opin6t3M/CvvnMG0md7Met4luhJ60iKp5HFdDL/dkC1BaZ2rgVi4V/QjNoXGaErkxfY78WowQm42A7d1VY8uyXk3AyFDbkaYbai4XZRZMFMp9kdt+fWLLiXny7eQBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767224529; c=relaxed/simple;
	bh=D2XsTOJPqHwL0ssQnFPudjZ8lc+SMIaegWV9PgQCdo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBUnmXsSUErSCRQ4c7LKKPk+Lw6PhzxFS74szooZGa3HYD+OqJ0KATMutxBb7OWtJv5AbolTtXJ2OHnkPPPS7kcxFCR6YgWY5k+RAJLi4nuQlNU7bWY4Gc+TTlL4V5CSQGvCmHll1a28CVoehV2LbMCbOOkOelLsCvPdAioMl7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBL8di6J; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBL8di6J"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88a347c424aso147927186d6.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 15:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767224523; x=1767829323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLGo2fh31/ETye5c6oqVDOdvXaVyPn4CoE8PfegDb8s=;
        b=NBL8di6JXvTnWP1G2jorpbFsHkxStL0rw+wmMY6OkuvOzoiuMYrmX6s0QDyG2LaJMn
         o7OLUBX3hKJ20LFXxhLdLpIRJ/IdXYuL1PNbEw69Sonbg+LTwmN6nHuVQEF6yfAMTPlX
         xqET7xNnDsyJZoCpSIknqwBpIANEYF0yQDsEnNtHVR/Yf5p1BRM++0akWJsIahcjjJJe
         QWHt02BfzbzunXohjbbfyAwoe0TzHZOWTjvAzmW59RGHyO+ISMqnoBRfQoDMkWr2JN+s
         zK8oLfda7/Ql6S+Z2njSVI+54Z/hNeSyVjNG42cQJVjNsLB6A8xztr93tRNelBZLIXTw
         /vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767224523; x=1767829323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BLGo2fh31/ETye5c6oqVDOdvXaVyPn4CoE8PfegDb8s=;
        b=M/PwDW1zDCamC18ccfbsen3oiLJAdX9SUTzLBwHDlZ1vspKB3cna3empuZIqwWXL5X
         EKRYYa7IEc2TARbuusAloEAdDS2IpPMiRogAmA8lNQ4fsXooD7Q3/vWfb0aGhMB6Rl0z
         xzYXWzs+bH2VSaJe7epqS4vyL2qv88QJSwqz9Qr48ubjftuyRrcCAugHmFMntxj+RdaO
         Bs59u438GJ8cDppFHToTHvGPzVXSZPB8rVbBOC561Z03Lj+cPp04bmwbNhUa8C5g3qyz
         dHDeIIQw3nayLyFWBhHFPjnwKrtx4oWLWeQuOBKj8ZWiRMIkxAjj2rWwaRSNvSsi96zp
         Mstg==
X-Forwarded-Encrypted: i=1; AJvYcCXUOPcBkx4lAcn+1mgksaiDmX/+AokfTUeYTmNMBZeRPIpxrsq0X6eQGnLQaQMU16lKLfZJCDbZERFJJ6c2Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMb/MgnqiUUVqFqfU9U/KCgJygPrTvjEPCi/idd5PXcWLcYyIL
	XY1Q0BRJqyAPxeENxgAjxCi7/X2IPvWkSJxlgaVVOSJBhvwKOWzLt3x3
X-Gm-Gg: AY/fxX6XAFbzBZrd9LMYOuSm6QqTOpVZmKIluXgBfyltez6yUIwPnVakEAsg06fugeg
	5NWi89UY1vL/dQmeYb3MZ9mDHfHeY/+kLy3reVCn7eYR+JYWq8iIaiyhEIjWdan5loNAVoO9b3j
	vx4XaGicNY/jMTizlhL4mwUYNhr5cCanJCm/XUx5nkjEaN7lBbzT+vonKWv3ruFfaETT4hDaGrb
	ehlC6My8atJ+7SkqwWSRPYwlBD2HCGIZrz8TDC/pksCxyWgtarWTD0q9Nnnsc6sf+7tFQSv8ra6
	y/W+Z8fTRW4ceJGU4Rk1WuMSxYttbStzW3Z3LMaXc+wb4k/Pe41cH9Vm7sbRH5HTWzWFJ7DnH/l
	oAG4T85+G/ZrcCSGr3/ZJ3qcyIZU1V9M2DeG3u9V0xqlTJCh28xYNM/iZDkFxVQ4fisqOzLCnWV
	XnAfL1UkfJQG6VC3C9ERUI14IcV3freeVdO/IMK41DcYiwpdWy4DW1Xbzf7taveQQMOaAIpwGuC
	14pQRp9MoLUfGA=
X-Google-Smtp-Source: AGHT+IH1NJdRTZ8xCaHfBz+Y0V6Q/po84PR8+wihf4B+bGDRV7qKnwAQD2/ETf130Ae7Sk/HTvSmlw==
X-Received: by 2002:a05:6214:5e02:b0:880:4ec0:417a with SMTP id 6a1803df08f44-88d843371afmr553121436d6.55.1767224523511;
        Wed, 31 Dec 2025 15:42:03 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aedafsm273106096d6.31.2025.12.31.15.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 15:42:03 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8060EF40068;
	Wed, 31 Dec 2025 18:42:02 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 31 Dec 2025 18:42:02 -0500
X-ME-Sender: <xms:yrRVab84RSGKqOwWejdp_nq5pjiXHGxl7Jmb0wnZNltNZqpbThje_A>
    <xme:yrRVaYI2M4HEU9BhG77QGuz6vjsIVI3QQBSeXqQBtYmNmitfYN1SeGCtSSdH4jnXv
    _ogNV2DLX_w0jTH2UqPYC4mBo69cN2PD2Dl3gled0O-AP3Oul459w>
X-ME-Received: <xmr:yrRVaYxxgmI1heNcAT5sxSBwFPSUEbhDAYgYpAcO9_7pGZyTNkzPSr7JspH1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekgedvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepfhhujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtth
    hopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegrrhhvvges
    rghnughrohhiugdrtghomhdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegtmhhllhgrmhgrshesghhoohhglhgvrdgtohhmpdhrtghpthht
    ohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhkjhhoshesrghnughr
    ohhiugdrtghomhdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:yrRVaT3wL4_x1KECaLuGp3EQR-qgfTKymExszDLG1emoo-dTi4Z5YA>
    <xmx:yrRVaZ8iJ4L4PWCHG5HBSPvAlRQoV87cM7Ru7AuBIKfd48KT1xlQ0g>
    <xmx:yrRVaTT3CxQrMhpWaiiHqQtZsS-t5WavLrUSmSMIXS0zF-2svIUaTw>
    <xmx:yrRVaQmBclmJgiyqjAToSV9EQHqzjf5sbvvFOs9wu7l7SJKt_92mYw>
    <xmx:yrRVaeVEgZdSgK1ekCrXTEF4A1ukHkXi1FDLpfZksfhrWdOL0Y-6zOVa>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 18:42:01 -0500 (EST)
Date: Thu, 1 Jan 2026 07:41:56 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, arve@android.com, brauner@kernel.org,
	cmllamas@google.com, gregkh@linuxfoundation.org, ojeda@kernel.org,
	tkjos@android.com, a.hindborg@kernel.org, bjorn3_gh@protonmail.com,
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
	tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1 1/3] rust: revocable: Switch to kernel::sync atomic
 primitives
Message-ID: <aVW0xK-93gpIU9T9@tardis-2.local>
References: <20251230093718.1852322-1-fujita.tomonori@gmail.com>
 <20251230093718.1852322-2-fujita.tomonori@gmail.com>
 <aVRgTQWhqjKB6xpK@tardis-2.local>
 <20251231.183502.304307662571984456.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231.183502.304307662571984456.fujita.tomonori@gmail.com>

On Wed, Dec 31, 2025 at 06:35:02PM +0900, FUJITA Tomonori wrote:
> On Wed, 31 Dec 2025 07:29:17 +0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> >>  /// An object that can become inaccessible at runtime.
> >> @@ -65,7 +73,7 @@
> >>  /// ```
> >>  #[pin_data(PinnedDrop)]
> >>  pub struct Revocable<T> {
> >> -    is_available: AtomicBool,
> >> +    is_available: Atomic<bool>,
> >>      #[pin]
> >>      data: Opaque<T>,
> > 
> > I actually think we should use Atomic<i32> instead of Atomic<bool> here,
> > because in most of the cases `T` is a aligned to at least 4-bytes (e.g.
> > Devres uses a Revocable<IoMem>) And in that case, using Atomic<bool>
> > doesn't save extra memory but makes the xchg() operation slower on
> > architectures that don't support byte-wise RmW instructions (e.g.
> > riscv).
> 
> I agree. Recent RISC-V support byte-wise swap instructions so this may
> not appliy to them. Among the architectures currently supporting Rust,
> perhaps only loongarch could have this issue.
> 
> 
> > My rule of thumb for using Atomic<bool> is: when you really care about
> > the memory usage, and you can guarantee using Atomic<bool> is saving
> > memory. For a general "flag" usage, Atomic<bool> is not strictly better
> > than Atomic<i32> in most cases imo.
> 
> I agree again.
> 
> Maybe we should provide an enum type with i32 representation to
> express boolean values like Atomic<Flag>? That way, users could avoid

Yes, that sounds good to me.

Regards,
Boqun

> writing unsafe code:
> 
> unsafe impl AtomicType for Flag {
>     type Repr = i32;
> }
> 
