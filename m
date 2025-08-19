Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B023C255F5E
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 12:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607643; cv=none; b=s+jyHZcxZZuV4KiT/0W4G+jMEpMsGhBD69rWmyKmOqKWmi+qsui+zOwOR+SwfdHnxaEewvE1r0ZuNieNaMiXykoxdbLGl3iRo2z3Owh4oNuV0zoYMaBISp5+sZ0ZND9LdUChpYdIWu1YXFP0pmORy1r/ZAVBUyN+81xd4mHTU2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607643; c=relaxed/simple;
	bh=lv+PvbSVe4dMYfPNa9LNq+MhRH/3j6fE6o5NPKGBAcA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CKS2J+0IeEVxzJMqm5iHovtB7imw6iUmxRpTg6E3kCiwkw99plF4YGIsksPe6TirI/sDoKffXphq3W+UV7xV0mIbE2cv1fWhoGk2gJNyQaJ6fsD8pTUMgBDx4st294FR4g+n5blNCrzYhnmgXY7ekF+TpiiwjdC02cJSlQWksC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VANTE5aE; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VANTE5aE"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-618b3c75161so3289555a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 05:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755607640; x=1756212440; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yCP3mARRCmGSyA8SjIJ4WFibLoFzgkIzQLXkcV/592w=;
        b=VANTE5aERJ1Zhp6480pn7SAjsDN2BoWOhitGsag9GF+/JRWRc9qzrfBdGZ/Ro9krfN
         AyhckEhZ6LwmgsV2w2UKfDmzXL07LoaERPFVKCTRNBWbd4QavxHxSWsszzUZW9xVfRFE
         +5L5BBEQqjq7ZXV7mhYEzQBIaPp5J3IRDN1tNZNZqh4XiJin1L7MhDHPN6X9w0C6JMGw
         p5HLTf5mO2wqygC3V9/F1SPjJZnll/YTicd/CS4JGomoEVgiyEhtHaCxNMjFF1Atfhlw
         Ix/+zz0h8HP/y9nOIwvFzv3Bzy7IonyCEgUf5IRgf7M+esLpXNJ3HoxoipE/KZyGsZQh
         7C5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755607640; x=1756212440;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yCP3mARRCmGSyA8SjIJ4WFibLoFzgkIzQLXkcV/592w=;
        b=YgZNHMTWDihFGrzMvvEMPDSKOyh2S1oUixjHaygraBBIcVDA+A0FkH1GVoyHJoBvFn
         jc2o08m339s2IEVjP3yPQjY1XAHtCznMTbxaacW2NF52d547xnUK726yB9oda/eYVZUD
         2yp3Gz6uvczY+AZa0z3brMmy6l96HPk3je2erxr7puOKOoFSkBglpBB0jsouvPAzA8W1
         kmfyLv+JhFFfWxwTANza5hwlMF8dPm+ct9IaOXJqSPGVPD0+iicxbz6RIF3v+zJAX/Nv
         9zZo0y+RiVuAbY4ghRXdGu117qLMGkqxtG5P3EaikeJKvpkWA2uMsX7zlLROC0ptG3Jp
         8U0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWE6xjparBCqg3tjuuXCaxMLjHmMRqFRoOZGNw6wKT8Io0f9tBGuCkZIOLS4/iBs9TrxzmHJwJvC8/oHtDYng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQqdXYeqfZj/7zEds9C2sbzYfvjUovkMvuRpdLHAmO2H19MbH0
	vSkC83AgfY6TvDWfG93PuEGoR8or5ow7Qze1fcdueQIn9H647v7fgi3uQFLG/OoIicNk1mdsx8a
	sE5hRmugtDo22U7/CNg==
X-Google-Smtp-Source: AGHT+IEm3E+YxF6ba6FVTvvJ2UxOIsdLdFxvx7w0w2FiBNMNteR5h1lV12gqN201Yr/4E2dtrSkazbFRx81rp1Y=
X-Received: from edah9.prod.google.com ([2002:a05:6402:e89:b0:615:3b67:8aaa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2351:b0:606:ebd9:c58b with SMTP id 4fb4d7f45d1cf-61a7e6dd3femr1764482a12.1.1755607639860;
 Tue, 19 Aug 2025 05:47:19 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:47:19 +0000
In-Reply-To: <DC6DQKE6LVNQ.3BBD8WF8XGROO@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250819-maple-tree-v2-0-229b48657bab@google.com>
 <20250819-maple-tree-v2-5-229b48657bab@google.com> <DC6DQKE6LVNQ.3BBD8WF8XGROO@kernel.org>
Message-ID: <aKRyVwfwnn5_MuB4@google.com>
Subject: Re: [PATCH v2 5/5] rust: maple_tree: add MAINTAINERS entry
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

On Tue, Aug 19, 2025 at 01:49:27PM +0200, Danilo Krummrich wrote:
> On Tue Aug 19, 2025 at 12:34 PM CEST, Alice Ryhl wrote:
> > Similar to and just below the existing MAPLE TREE entry.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > Liam: I'm not sure what you prefer for the MAINTAINERS entry, so let me
> > know if you want anything changed. There are also a few other options,
> > for example, I could just add the files under the existing MAPLE TREE
> > entry? The get_maintainers script should still send any relevant patches
> > my way because they also match the RUST entry that has a wildcard on the
> > rust/ directory.
> 
> From v1 [1]:
> 
> 	>> We should have another section for the maple tree, since it's not just
> 	>> used for mm.  Your stated plan is to use it for GPU allocations and the
> 	>> code doesn't live in mm/, wdyt?
> 	
> 	> Sure, I can add a new section if you prefer that.
> 
> Maple tree is already used outside of mm, e.g. for regmap stuff and I also use
> it in nouveau. Hence, I read this as moving maple tree to e.g. lib/ adjusting
> the existing entry.

It's already in lib/ ?

> I personally think that - of course unless the affected people prefer otherwise
> - it is usually best to keep a single maintainers entry for the C and the Rust
> code. Maybe Alice can simply be added to the existing maintainers entry?
> 
> What do you think?

That works for me too.

Alice
