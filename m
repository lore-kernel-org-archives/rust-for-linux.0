Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019562E3362
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741188318; cv=none; b=VFkqP4/ApxpXA4o0S1AZJLL1IxzAeeQ4tIER/Hk/4WnzQIKzGyGQ/VcVMvN8vZUQ7fvNniH6UImyKYZm7pRaIZh35N9UBaFzgdlM74XIZYQGifjXDQxdmfLzfuQi8E+KictuHNnYoBcZ0PUMQGkNFsnfFSeVN3LZx7hnq/xTpiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741188318; c=relaxed/simple;
	bh=s4G0hNZZuRWgTcmPUy/NnLQSrHqIGsGL1QAhfQasjDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3AsKgjwerdKSKSDD+3CtU5Ff6InXSvuCNEH6oQD/NkipMopPp2y2HF/JRxAP5AOeiAl+eCqt876vlhgAcZoAvj8LO3HiiZBYcdUycJe9rACUCY8LEr2ULJHIbHUJ2ezXENySObya9h9mhKpPzt5XqZ2ZCs3MyIbyzZF2NdajHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGS7T4Gx; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGS7T4Gx"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c3d1b78b93so127301385a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Mar 2025 07:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741188314; x=1741793114; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4UEhnEeXuFB9KX8onjbbjwimaB9Pcxdlj0VOqngd2+E=;
        b=PGS7T4GxAfq+qx769I3bNTL8wegJmr+EdfXz6f3PbLHGRygWIwf95TK8NWX5b8LISB
         G6YEK9OC/05AsUYDjUwUcc3jQ9PEHnA1pPdGdgrzsJErQO1WxwZdV4vPY/y4HAU3rpfF
         EHZsw1zTdGD5HdQEha3JtU9GUOt6QCwnSE7bXdGMjVNejZmDE050eFMYdJIA7R6KzQCs
         1sYj0zlGUEk23oRb0ao1ZV99f517IfkP+d+e8AZRmQTo774rwLbvM9UBWXOXfCs573Xz
         A8VVeyeDQfNYy4KiVORoQTjg1UcFJcUKP59rgYXBqpOTl0HitReJzC2JjpOfodRIVCpW
         sJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741188314; x=1741793114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UEhnEeXuFB9KX8onjbbjwimaB9Pcxdlj0VOqngd2+E=;
        b=p7oQD5+KfVS9LiveUQAO+AlCRxeZA7lPek8EqxiXYqZ7YR2fwWlWE/K7hsaqqRRyu7
         1Of3j++jIOfCl0VcKDoI3Hb4Ted2Zd003F21iZx9++0m+QCYIdmxxs3K/+47jZ1pV+JY
         38h9ZS79eKcXg7lyYwAgk+jJIe3oi8CD/jX255iZus1g57iyDlkR5Qa59FMTg5IiPu+k
         fCzAkOOc9JJw85ntYcNfaEYY/Ika7NFEl93tkc0geuKU/n6NaBf+++ZOyIoiPifBvaSS
         tkd6XOfmrFdM2JuaovTSKflplBoO+SxBsD6kR91w4IdwepxzjsB4lPE8i0acGAMR4hko
         4yEg==
X-Gm-Message-State: AOJu0YzaOqAmpOLSVCHfqG3WcAGSRt9pAToiWbMx1oL5dvFVQnKq/wak
	wDmCaN1rfYOJg6y5GVYo1/9oYZ0j4CMNcHLpsAr8TGMDxwGtRVo5
X-Gm-Gg: ASbGncuF6BQ/FXCWiHmrmaMl7FKcZDCQ53q0qa02K/1Xxvt+xluyOUuQS9tapfVGLSO
	ICP5YB5B0i2RA5XQ49iHaphvs56EpEAyV6N9PtbklD3ZLjty0i54tr526WeWafaPAtEdW7Fs4X6
	66u/Ep8YH2UuTKRfIa3DeMq6yDzJTosOiiHddsuKB7832IyIKZn2VI30qCbndJGOHNL5lPqeQmF
	lEEU/qvOxBPf5uyIpzGMnqadzWjDyHCR4aaqyHKvR/EVM7ne5kOlnx9eIVmN44ZPfzF3I+rLszZ
	g/crsDyf2QazxUQjxDqyZz7ts3BKMjtd12Q5lYlo8mdqhPgIKSDVPfc/3cA37NUP1Oew3LdMqOC
	6OqVGCyfU6a6SPZKiI/PAEJdNOUbaP06oTTg=
X-Google-Smtp-Source: AGHT+IHkVyr5przSYVKtx6NKKMpMVJ9p3ARkZUUCI7FikX1BAtjD1u1Nf3dS/3yLSXXqGeiYOW4tjw==
X-Received: by 2002:a05:620a:8392:b0:7c3:cd78:df31 with SMTP id af79cd13be357-7c3d8e4655cmr507377685a.45.1741188313556;
        Wed, 05 Mar 2025 07:25:13 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3c0d34fadsm390639585a.12.2025.03.05.07.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:25:13 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id BFCF21200043;
	Wed,  5 Mar 2025 10:25:12 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 05 Mar 2025 10:25:12 -0500
X-ME-Sender: <xms:2GzIZ2GsMwoqLJtil6xHFdLIwmwFkJDtrm4djv0kIRE2H_c5IPDvyQ>
    <xme:2GzIZ3WnQRQa2Oxu-u8-qe7nM_ANRGjNRfbZ24a6Q8zf5h48RF4-P05aZBhxMV3LF
    C2z21ViqMrPymzxLg>
X-ME-Received: <xmr:2GzIZwLDo2kGbHJ7OlnNUdQqU06FtQYqWMrGZoZGG5LBLVJ61hOqt-8pRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdehudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddt
    tddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrg
    hilhdrtghomheqnecuggftrfgrthhtvghrnhepgffhudetvdejueetieeijeejtdduhfdv
    ffdvjeehffdtheevtdeuhfeuheehiefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhq
    uhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqud
    ejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgv
    rdhnrghmvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepughirhhkrdgsvghhmhgvseguvgdrsghoshgthhdrtghomhdprhgtphhtthhopehr
    uhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhdrrghl
    mhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehgrghrhiesghgrrh
    ihghhuohdrnhgvthdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepthhmghhrohhsshesuhhmihgthhdrvgguuhdprhgtphhtthhopegsohhquhhnsehf
    ihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:2GzIZwFAqeIWoepzZT5z46xmqnjL84O21KK59s2_QIPOQti2b7oeew>
    <xmx:2GzIZ8XqwKxEBOwpv_HXW9whK9wmsYPNjNtSFY83qLLogNdFJi7uNg>
    <xmx:2GzIZzOQk6VJmd9gHzzGPljIGt9JlERSN0TEp6ou30g7Z0WBcBZ8bg>
    <xmx:2GzIZz3JA69MgVq_WUzz-QWf9onsojFdk-SL8YuKiIF2WJ_DFZg2iQ>
    <xmx:2GzIZ9VJVl4XEq5N-eEJccnXbkwgvqWlNETa5PsXZT4H6qY-uoRXV1yH>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Mar 2025 10:25:11 -0500 (EST)
Date: Wed, 5 Mar 2025 07:25:10 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org,
	daniel.almeida@collabora.com, Gary Guo <gary@garyguo.net>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v3 2/2] rust: types: `Opaque` doc: Add some destructor
 description
Message-ID: <Z8hs1s5Mf1TMedIv@tardis>
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
 <20250305053438.1532397-2-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250305053438.1532397-2-dirk.behme@de.bosch.com>

On Wed, Mar 05, 2025 at 06:34:38AM +0100, Dirk Behme wrote:
> In the discussion [1] some `Opaque` documentation updates have
> been proposed. In that discussion it was clarified that `Opaque`
> is intended to be used for (partial) uninitialized or changing C
> structs. And which consequences this has for using raw pointers
> or the destruction. Improve the `Opaque` documentation by adding
> these conclusions from that discussion.
>=20
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Link: https://lore.kernel.org/rust-for-linux/F8AB1160-F8CF-412F-8B88-4C79=
D65B53A1@collabora.com/ [1]
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>=20
> ---
> Changes in v3:
>    * Add the "terse" proposals.
>    * Move the non-linkage artifact from patch 1/2 to here.
>=20
>  rust/kernel/types.rs | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
>=20
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index af30e9c0ebccb..f370cdb48a648 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -271,17 +271,33 @@ fn drop(&mut self) {
> =20
>  /// Stores an opaque value.
>  ///
> -/// [`Opaque<T>`] is meant to be used with FFI objects that are never in=
terpreted by Rust code.
> +/// [`Opaque<T>`] opts out of the following Rust language invariants for=
 the contained `T`
> +/// by using [`UnsafeCell`]:
>  ///
> -/// It is used to wrap structs from the C side, like for example `Opaque=
<bindings::mutex>`.
> -/// It gets rid of all the usual assumptions that Rust has for a value:
> +/// * Initialization invariant - the contained value is allowed to be un=
initialized and
> +///   contain invalid bit patterns.
> +/// * Immutability invariant - [`Opaque<T>`] allows interior mutability.
> +/// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of shared ref=
erences.
> +///
> +/// Further, [`Opaque<T>`] is `!Unpin` and will not run the drop method =
of the contained `T`
> +/// when dropped.

I would move "will not run the drop method of contained `T` when
dropped" to the "Initialization invariant" above because they are
logically related.

Regards,
Boqun

>  ///
> -/// * The value is allowed to be uninitialized (for example have invalid=
 bit patterns: `3` for a
> -///   [`bool`]).
> +/// [`Opaque<T>`] is meant to be used with FFI objects that are never in=
terpreted by Rust code.
> +/// It is used to wrap structs from the C side, like for example `Opaque=
<bindings::mutex>`.
> +/// This is useful for C structs that are not fully initialized (yet) or=
 might change their
> +/// content from C side at runtime. [`Opaque<T>`] gets rid of all the us=
ual assumptions that
> +/// Rust has for a value of type `T`:
> +///
> +/// * The value is allowed to be uninitialized or invalid (for example h=
ave invalid bit patterns:
> +///   `3` for a [`bool`]).
> +/// * By dereferencing a raw pointer to the value you are unsafely asser=
ting that the value is
> +///   valid *right now*.
>  /// * The value is allowed to be mutated, when a `&Opaque<T>` exists on =
the Rust side.
>  /// * No uniqueness for mutable references: it is fine to have multiple =
`&mut Opaque<T>` point to
>  ///   the same value.
>  /// * The value is not allowed to be shared with other threads (i.e. it =
is `!Sync`).
> +/// * The destructor of [`Opaque<T>`] does *not* run the destructor of `=
T`, as `T` may
> +///   be uninitialized, as described above.
>  ///
>  /// This has to be used for all values that the C side has access to, be=
cause it can't be ensured
>  /// that the C side is adhering to the usual constraints that Rust needs.
> --=20
> 2.48.0
>=20
