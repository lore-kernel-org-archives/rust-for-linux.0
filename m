Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40F42D876A;
	Wed, 25 Feb 2026 19:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772048922; cv=none; b=rTaR3bVVbsVmOR5GW9t6WHSE8HrIBQdmtaRt0uipCYN1j8ZA1VmXXh+tZ1sPl7fcyKI8ZDmQwYu854evpsD+Gx++4oWnKaCk0Z/lZ7B6x8xF1S8IR69uRyfWHTtAmLG5r4cI7XpDtu7JVzMAIwVzhzNgKJf5wcb54phbQtkw0Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772048922; c=relaxed/simple;
	bh=K2Thy+cfo8IGrm9J3gFlrop/sJOrdHourjqbZe7bYVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOuPELPAEb+txM9LaWLYf6mLDqF4IXcumzkjX8DH1eXufdDW5qSaWptzTClBX52VQx/M+FbB+x/2Y6MAjmHuMe8a+Hda9PtsCVixxlttGzybZrVIzFkJKWYVvPsGCG4kuTifPoLUK0Mq+3/Jqik7WuWuae8UN6uRp6GXhCjdHlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpKsM8iT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpKsM8iT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1245CC116D0;
	Wed, 25 Feb 2026 19:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772048922;
	bh=K2Thy+cfo8IGrm9J3gFlrop/sJOrdHourjqbZe7bYVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpKsM8iTP+Ar1Wf7dzecNATnhVKbSyGteQq7w4VAJMzi/nH4aIJIWvhQ0VqhpqFem
	 ARKsahKUO3xnVzOkurrPKQV5dk3OhEscaqaWiIBfKmvjR4d1XgbsCHJrXzw4GkrEEt
	 /fmSASYSs7TOhKkH+/VuXkeMIvs+Ivw1cHd5XnjhJEdLwifv08sHfEsRekneDuLrbJ
	 sII96zHGA2jjBnXcnHSmOfIYKuDGk0Tmj/VD19ucvoLak7hgXrgPm3otJuT4MEz2cI
	 J4fSkXg1Zxb6YsmwALV0qOcntbpBq/DucFpgL5Y68sqJ67XF0AKf6bdqJyQULCF/zK
	 0y/e66pvIDX5w==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 316AAF4006B;
	Wed, 25 Feb 2026 14:48:41 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 25 Feb 2026 14:48:41 -0500
X-ME-Sender: <xms:GVKfaaAi8FIFLztlmdfvgB7vzzc3XD7KIg89Nj_ZMQwwrbv8Pq2MGw>
    <xme:GVKfaTy2kN_Nt-Gn6hXzIO39R4wDEKotJiizDpxyng5BwNq0x2fQFjxyU51oJ5qD-
    f2R6Vs-tvDVsnJE-UEm96Z1SnUF9UMlBrpJDHX9FIOXKk1U5cCWAA>
X-ME-Received: <xmr:GVKfaQZ0BlYytldrVEl31YtcBp_qRAYo8mTUzx7hstHzBQaScQdyop8_0vRNbRbug7epLg7MpqKisi7Oq9zwb_XKzHoVp09K>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeefleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggr
    khhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnh
    gvthdprhgtphhtthhopehjohgvlhgrghhnvghlfhesnhhvihguihgrrdgtohhmpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghjohhrnhef
    pghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:GVKfaQSiVhNb9SrGJn_CTx9vf1ZU2IMu41EAY5tdXFJqPqzr4GiFuQ>
    <xmx:GVKfaTjcbhg-i6wzn70Ry3IJEhTQqIcP-VC2mjxL6xUfQpQYCEg-hQ>
    <xmx:GVKfab5isXBVPZ5SYxZcriOhneMhiwO1A1Q3SGWb4M1HXo9YqPOOJg>
    <xmx:GVKfaemleS5ZHYf_i3ltJvPXSacnPLLi87pWLpGFVQjTUzb89WBN1A>
    <xmx:GVKfaUPkGWkeMqgMLmVjjh6cRjeOMSqWN-aLXyqxuz75riSutrAvH9Yq>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Feb 2026 14:48:40 -0500 (EST)
Date: Wed, 25 Feb 2026 11:48:39 -0800
From: Boqun Feng <boqun@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Dave Airlie <airlied@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Koen Koning <koen.koning@linux.intel.com>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
Message-ID: <aZ9SF5ql6OCdaFi8@tardis.local>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
 <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
 <DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org>

On Fri, Feb 20, 2026 at 05:48:37PM +0100, Danilo Krummrich wrote:
> On Fri Feb 20, 2026 at 2:09 AM CET, Gary Guo wrote:
> > On 2026-02-19 16:24, Danilo Krummrich wrote:
> >> I feel like it makes a bit more sense to have an entry for the entire class of
> >> "RUST [FFI]" infrastructure.
> >
> > I don't think so. Most of the kernel crate is doing FFI. We have a `ffi` crate
> > defining FFI types, we have `CStr`/`CString` which in Rust std is inside `std::ffi`,
> > etc.
> 
> The idea is not that everything that somehow has an FFI interface falls under
> this category, as this would indeed be the majority.
> 
> The idea is rather everything that is specifically designed as a helper to
> implement FFI interactions. (Given that maybe just "RUST [FFI HELPER]"?)
> 

I feel like you may want to call it "interop" then, because it's "Rust
doing something with interoperation on C data structure". If I
understand you correctly, the category you referred here is the area
that we could not simply call an FFI function to get the functionality
from C side, but rather we need to make sure that we are interpret C
data structure correctly to work with C side.

Regards,
Boqun

> For instance, this would also apply to Opaque and ForeignOwnable. But also CStr
> and CString, as you say.
> 
> But there's also lots of stuff that does not fall under this category, such as
> pin-init, alloc, syn, num, bits (genmask), fmt, slice, revocable, list, ptr, assert,
> print, arc, etc.
> 
> There are also things that are more on the "partially" side of things, such as
> transmute, error or aref.
> 
> > I feel that the FFI infra is the core responsibility of the top-level Rust entry,
> > while specific stuff can be splitted out.
> 
> I think the core responsibilities are compiler and general design topics, such
> as abstraction design, (safety) documentation, etc., as well as core language
> infrastructure, such as pin-init, syn, alloc, arc, etc.
> 
> Given the definition "helper to implement FFI interactions" I feel like we have
> much more infrastructure that is not for this specific purpose.
