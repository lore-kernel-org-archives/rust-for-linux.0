Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CF8362131;
	Fri, 20 Mar 2026 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773995896; cv=none; b=nRRXTZWDvX/HvO00gSW2gfS5Z1b2Bk17PavpEawkJz/SR6XfXBroS4gnVDre17kG7nW/nIeah3bf7heKFy8BOzr/QEfIHBRrefpOVkiOZH3PrUoKw6OC2W1FYOhfaCfaI+snqBLnD2sTWCg0B/holWjoGL1u10maC6MKgDyg4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773995896; c=relaxed/simple;
	bh=KaMJBR5dkOtKo1Kf8P3Oo5RAtCbCC37hTSbLDWfbN2o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YjvQ7bjFlHgcT58nomLjr4UorzgpvXgf4qPrv5fQ86B6vgwxHlIX5ijbxbrYxBpRKYO3pJhSfKbIjkU7fGEmbhC8DNc9/LSPT2shQZuw3kafJCcxHAegDyJJVjg4F51thdWbgkLVxhiBCRh4yMOkNXKEcq11Oh8eg4hsWtUGQ5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=hCnmXcq2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eM2Nozae; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="hCnmXcq2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eM2Nozae"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 82A08140011B;
	Fri, 20 Mar 2026 04:38:11 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-12.internal (MEProxy); Fri, 20 Mar 2026 04:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1773995891;
	 x=1774082291; bh=Rpt1Ga690qruvydtf9n9lbeZSmPtb4KuE37H2OCV4aY=; b=
	hCnmXcq2Ha7iyylGVGYH8gjwFVNL9CjL9yyDgo5lIlApIasg4k6HiMLaOShhx4BD
	N5GGPV8AWQs9CXhEW0IkB0VNR5xAHi+KWrSbtp3tyQBORxkJVdkyJBp316V5JUVN
	i4VKHVT8aIsSQu+0MDfe6Nn0WJbxaIMN4gn1xOpXCuvBU0qRNpOgvM6eawGG2xG0
	Etm2NF+2KFd0Z9eh92jxktvfE2TQy3dESL7EdILtxNIJYxF9vZoLq5WzWZ4ZtHCt
	39+/hbBA3S0ZSdOnacOSpIGder8mjcEUyoDC32T/971+yywkpDcO0I9U7Zz+zkQ/
	SZp+peY9rOpjdBl3QSr11g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773995891; x=
	1774082291; bh=Rpt1Ga690qruvydtf9n9lbeZSmPtb4KuE37H2OCV4aY=; b=e
	M2NozaeNbYD6iHVgjD5Khihw9m4Ogm9sJFAni25W9m71c5SLmRkiN6vlmxXX0mAI
	7WtFzPWkLVLVCF65BCiFve9Yel+KbIeQO7zEeC2m8/bxfwiPJIrQIIUd/5zQTp6o
	GGN6Yl9xzOAY6guzRY0sMlm9+A9W+LCP6zlojpft2ywx/YLS3s36TYrqWJ/iWXUs
	88ht0Stm3++FjeF6yh0BimLtT2dVfLyLXfv381ZMjUSgIWb0AI13O4WOOml8d4e7
	7eY9K2uqWqh2gJfjtjev7CucYcyIOmWRoXVewcqpLd3SkkE2OE+W++aX+E3tOuKm
	AlgLcLDSfZYqHskudUbXA==
X-ME-Sender: <xms:cge9ad9AaBXY7lfk9ugO-RmJYgi9wNwXSukgeyy5ryn1_h0GWr3JvQ>
    <xme:cge9acjMztI0gegYD6skne2INfkkhhirz3AFYulAvgkvJjwLKGsaWMVVRU4i-N4My
    3T5OfgS0OuTN8PNf_0r_fruQR2qyi-8tp7lOsZ2v2Id9xfWmyeCEA0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdelgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfffgrvhhi
    ugcutfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqne
    cuggftrfgrthhtvghrnheptefhteefhfefteffffffteevueejleeiheetgeehffeileev
    fefhkeegkeefgeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopedv
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrd
    gthhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegr
    ihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrdhgrgihnhhorh
    esghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdr
    tghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtph
    htthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprgdrhhhi
    nhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:cge9aWzogamezZ6yo9C_kWDPRcnmnxs-kauJlEaQHRRUmmcDyGqstA>
    <xmx:cge9aT4FeuRW3ZWU3lSUz8t5rMawat4IvbCshNIQm-xkbgn2dmSj8Q>
    <xmx:cge9acbUk-iDCufF5yU96s-7PZ5588W4u3AdtJQQhMTr4cX_wtX7Hg>
    <xmx:cge9aS8jtXgk_3SheR_LPO8Zrml_ZTKNAZtCFhKE0jjTxFXZ7ZVCpg>
    <xmx:cwe9aWPNvN6vDP5BmkO3QO4i94XllTS5NIv1n74BoreS18oZITzDbYpS>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A954115C008F; Fri, 20 Mar 2026 04:38:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AtQVIY85vbR-
Date: Fri, 20 Mar 2026 09:37:50 +0100
From: "David Rheinsberg" <david@readahead.eu>
To: "John Hubbard" <jhubbard@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>,
 "Shashank Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Message-Id: <125cb5fd-55fe-4c54-bdda-0478f5a8aabd@app.fastmail.com>
In-Reply-To: <20260317225355.549853-17-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-17-jhubbard@nvidia.com>
Subject: Re: [PATCH v7 16/31] rust: ptr: add const_align_up()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi

On Tue, Mar 17, 2026, at 11:53 PM, John Hubbard wrote:
> Add const_align_up() to kernel::ptr as the const-compatible equivalent
> of Alignable::align_up().
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  rust/kernel/ptr.rs | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index bdc2d79ff669..7e99f129543b 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -253,3 +253,27 @@ fn size(p: *const Self) -> usize {
>          p.len() * size_of::<T>()
>      }
>  }
> +
> +/// Aligns `value` up to `align`.
> +///
> +/// This is the const-compatible equivalent of [`Alignable::align_up`].
> +///
> +/// Returns [`None`] on overflow.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::ptr::{const_align_up, Alignment};
> +/// use kernel::sizes::SZ_4K;
> +///
> +/// assert_eq!(const_align_up(0x4f, Alignment::new::<16>()), Some(0x50));
> +/// assert_eq!(const_align_up(0x40, Alignment::new::<16>()), Some(0x40));
> +/// assert_eq!(const_align_up(1, Alignment::new::<SZ_4K>()), Some(SZ_4K));
> +/// ```
> +#[inline(always)]
> +pub const fn const_align_up(value: usize, align: Alignment) -> Option<usize> {
> +    match value.checked_add(align.as_usize() - 1) {
> +        Some(v) => Some(v & align.mask()),
> +        None => None,
> +    }

This would return `None` if the value is already aligned, but the addition overflows `usize`, right? For instance, this would incorrectly return `None`: `const_align_up(usize::MAX - 1, 2.into())`

FYI, `core` provides `usize::checked_next_multiple_of()` ((const-)stable since 1.73). So an alternative would be:

pub const fn const_align_up(value: usize, align: Alignment) -> Option<usize> {
    value.checked_next_multiple_of(align.as_usize())
}

David
