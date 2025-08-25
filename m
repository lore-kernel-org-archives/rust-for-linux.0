Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1493D288D6
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Aug 2025 12:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756125019; cv=none; b=AjwF1mUx/xSckZLDGb/VRs4Tq9UWeBpifri8CFwkP1bJcNxyRyuObEgDl8XzLFtquU81o0ePBMdxsQgFdSJtHTt1xcue/eQuPQc/QDahqGSLzFesdoQ3IL+MTmKltJ26qHZTcC2DY0m0RiNnETr2J5CtFERw8U6ZVn/J7LoWg6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756125019; c=relaxed/simple;
	bh=zns+KohtBJoI91qRRuLq011AG8NdO6t1QfjmI9CqelI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tSqwOO+a2l1HYyBSIvtphCL6+RW+oincGhfMB/JHpmgDTmU3HT1HGmwW+XClvDKk4X1z9kgPIRdQBSpNKwuAgTk03IHbEpj6YZPo5NRGwrcLUbkXVtf2MBrn9lIrYNpAtWKjyagaraBwULTauOqYzOPZUcutG1wjKEIhxI+4lNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZS9wJZSt; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZS9wJZSt"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3c68ee43c76so2082656f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Aug 2025 05:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756125016; x=1756729816; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SLj1YIFjwaRAHRpa3eawEDP1UKRYIus63pdnhlf7p74=;
        b=ZS9wJZStYb8R5YypRuhS/fSOz6BA6nGlpoaHjtmUcGWetoA46kzb7SaiMACzoNtrwj
         KMtITdu4cSbpy/Lh3GBpCXddyc+zrXizP+PY0LpjdULHfu/vu0/RqYy+mmgeepJhya3+
         nf+OwfxJ2Nr4Y53zuQLCESH6d5qMmW+Q/Dny5StagAVotBHRkB7JFeJsOe8eRIIWhIVr
         bKCqkFLrGs5eh1NfjP02Cca7pXeWM2cN9xqeLL9E69OuFJk1ibJgd2zFLmW29kJryMfN
         GpgatWqIXF8xKv7hVaTNs1ki3QDuvLbVKvgwOu8flAxP+sUUsNdvVVbG2cYjfqlHSYSZ
         Osbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756125016; x=1756729816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLj1YIFjwaRAHRpa3eawEDP1UKRYIus63pdnhlf7p74=;
        b=xAMrA69JzqOK5NpZZHSgSYL09exaZmL65gX/qs21GOmsp2P+P2bOMHXx/roPWcoj5w
         ykYGwV2MF+dKpA+nZJskMU4dsZNCpoxv9abBvwOsV1Hg5ilz8Pu0dfZkCDIeyp1DrSHG
         4z/YmhPSsLOBta53ktcUOCsTEuKfpCsBD8eEo31fS/NZxjKv/wbUhViItvGwcyvMzBen
         +Bbo0Isr33nV6LghYffM5xgnzn4za7DWxAIc9HtHdNpjylaEWFMF7aWA27zRwCEZyozP
         BFFZJbQ03paCns+e0kWp0kWrVI4f5yswOBhLxBW0+PFOU0dx9AX6d7V55IMbyBF0n5nh
         75vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU+oKa7+CzzcypZyBnHVbL3+5Pd1Q9ecG+dPeDjW2508bxE70am+cxicM3VV3s3NpSnBWh0vbnB52SvoPOJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuaKPmsIG1tvGWqoPffzxWCXN1Aj8cOcVCxJA9WAn4ViTIU8qc
	DM4eVw+lCa5/27SS2iauXv3MXDITikDrUNeDNolbSu9YV4VSArsnPc8EEi45ao3mplgnZOKw4ZT
	RU6N9tPM0Bhp2TtvKgw==
X-Google-Smtp-Source: AGHT+IGfNfFcJqlPPh2CO3TEuFlkWXy0Jp7NPDl4lcwbEkAaO8Ya/l16lBvI3Ir5wd+v5zFUtMC7R0Fb1fNxLXs=
X-Received: from wrbeh5.prod.google.com ([2002:a05:6000:4105:b0:3c9:38ca:2c34])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5887:0:b0:3b7:78c8:9392 with SMTP id ffacd0b85a97d-3c5daa2b898mr7662572f8f.19.1756125016321;
 Mon, 25 Aug 2025 05:30:16 -0700 (PDT)
Date: Mon, 25 Aug 2025 12:30:15 +0000
In-Reply-To: <5ssx3vakl3enjeaygpxfqtb26ufehwfjvcwqfna4xbhc645xpj@lzuvaf3my3f6>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250819-maple-tree-v2-0-229b48657bab@google.com>
 <20250819-maple-tree-v2-5-229b48657bab@google.com> <DC6DQKE6LVNQ.3BBD8WF8XGROO@kernel.org>
 <5ssx3vakl3enjeaygpxfqtb26ufehwfjvcwqfna4xbhc645xpj@lzuvaf3my3f6>
Message-ID: <aKxXV5BgpW9Gzw-v@google.com>
Subject: Re: [PATCH v2 5/5] rust: maple_tree: add MAINTAINERS entry
From: Alice Ryhl <aliceryhl@google.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Ballance <andrewjballance@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

On Tue, Aug 19, 2025 at 09:36:10AM -0400, Liam R. Howlett wrote:
> * Danilo Krummrich <dakr@kernel.org> [250819 07:49]:
> > On Tue Aug 19, 2025 at 12:34 PM CEST, Alice Ryhl wrote:
> > > Similar to and just below the existing MAPLE TREE entry.
> > >
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > > Liam: I'm not sure what you prefer for the MAINTAINERS entry, so let me
> > > know if you want anything changed. There are also a few other options,
> > > for example, I could just add the files under the existing MAPLE TREE
> > > entry? The get_maintainers script should still send any relevant patches
> > > my way because they also match the RUST entry that has a wildcard on the
> > > rust/ directory.
> > 
> > From v1 [1]:
> > 
> > 	>> We should have another section for the maple tree, since it's not just
> > 	>> used for mm.  Your stated plan is to use it for GPU allocations and the
> > 	>> code doesn't live in mm/, wdyt?
> > 	
> > 	> Sure, I can add a new section if you prefer that.
> > 
> > Maple tree is already used outside of mm, e.g. for regmap stuff and I also use
> > it in nouveau. Hence, I read this as moving maple tree to e.g. lib/ adjusting
> > the existing entry.
> > 
> > I personally think that - of course unless the affected people prefer otherwise
> > - it is usually best to keep a single maintainers entry for the C and the Rust
> > code. Maybe Alice can simply be added to the existing maintainers entry?
> > 
> > What do you think?
> 
> I'm not sure what you mean by lib/ since the lib files are spread into
> other entries by the looks of it?
> 
> I'm okay with the entry below or adjusting the existing one.

In that case, I suggest we do this:

 MAPLE TREE
 M:	Liam R. Howlett <Liam.Howlett@oracle.com>
+R:	Alice Ryhl <aliceryhl@google.com>
+R:	Andrew Ballance <andrewjballance@gmail.com>
 L:	maple-tree@lists.infradead.org
 L:	linux-mm@kvack.org
 S:	Supported
 F:	Documentation/core-api/maple_tree.rst
 F:	include/linux/maple_tree.h
 F:	include/trace/events/maple_tree.h
 F:	lib/maple_tree.c
 F:	lib/test_maple_tree.c
+F:	rust/helpers/maple_tree.c
+F:	rust/kernel/maple_tree.rs
 F:	tools/testing/radix-tree/maple.c
 F:	tools/testing/shared/linux/maple_tree.h

Optionally we could add (RUST) similar to the LOCKING PRIMITIVES
maintainers entry.

Thoughts?

Alice
