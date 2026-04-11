Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00198248886
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Apr 2026 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909523; cv=none; b=hSfKt1Hw8OX/rGyN2jd3EGg1SQu2AGBzGsIuQE+uNpJroizpKJNleeoIagopFmDJow3zzvpV3S4GrRmQF792fONrMk5YlXJIiG6dvliAIZ7pqk/iWEgqBpY2UIvCeHieP+xP5C2nW73PCXIQ/CCWBVzdTiJpeoxbGdimrWrA6jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909523; c=relaxed/simple;
	bh=zsYs4OLXoGqDPcSmx3jK/qfu7bvAUeaA/qPH6qC3Rpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4aROy+ez93wh0blYzpbIUUC5KHWKqXYprk30hbpEWFnKLFbfn+J6QmOYdYHy7m/Mu5fhROOa2Q2NS8NLlSh+3N8Zgt6nuNEnQUyWfO+0rjRK/saIzIhCVde3KFotV47bfbMvniTnBnyMeVZiqs4uSXhCXftaBiQwQyxLtn5VAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=GhHhkdZp; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="GhHhkdZp"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82f0fc82c76so579961b3a.0
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Apr 2026 05:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1775909521; x=1776514321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q1SyhuRgernCsatZuwdE9rDQ3zbipJuCy6jd3/mR088=;
        b=GhHhkdZpXhM74OnGkCRGDyH9B+Y/4SM9f1ixBpL9QEypLH4kq9kOADV5/gMuJfW4KV
         dGNOFJs+B9GHQpgBg1qEbnYBb/E9CkKh5ky3FqdunGWWDeVxHyfpJBD6im2HmDKms0W1
         lYr6aLRFmlqExWYOpcT3H8THNG0vBdbk0WzSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909521; x=1776514321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1SyhuRgernCsatZuwdE9rDQ3zbipJuCy6jd3/mR088=;
        b=fS2/6EEzFr+83MU6efzeoUnu4YxFfuTqYB0kRkvRvVtPRED61Wg6n6AgETyeL7uE8T
         xAG1CQSEE5CyzU00RCSZBrLzflTgyXz1m/Ry7l99KLWJ8xct7kKDoxGjYtLSMr3h+Ajd
         r/mZzxeTa7QmSPp9GtqODRgDcW2TMcDlFM+FnUojxmosQw+HIpBNGNJU75nsZPI0mCy2
         fHICpss12hnZ8a4QIh7IpPjTGdApHpqnSDy+aqZpRF4Mu4Ms0Qq1zSB5BRixws5nTdgm
         pxM+rZUGzihSoM/jLJ/wGTn+BNVNyI9wjT3KchiqwCvhSsFBJajG1KhGqmjr/41UGzJs
         Y6qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpECtVyRTV+ach1x6j78bKOPXOV9mWeXz10MLGrp909WIj+jNVX2ebOrNBRnmLS+jL7/tzTO0zs4gSUN6Ulg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7J09V4336URu9eYzsnQVS9Ksyh9DigJJ09c4zm/kUGtJ/ypl2
	dQqXx0JnCKOuiE19jHZAREuCrrpqBRTRCM2NvcpgLHDWO44aU4swMcEvy8WHglrofzI=
X-Gm-Gg: AeBDieuSBKY/aYz5PZJ7XZFnQC0RvXuYTF1lHnE/wKq816hmObSY012WpCQtbH4SQM9
	uvauKcwvat4vTgvKVlSl8OsWo+jA2PMoTBYkLnTFIMFd0iUSaGPQInNAr6OCaKiPhKmS7ho6rpS
	Y8cS7F+ivsTxuVmR4spM47XfYlFQYE9qN7tULalpWxyjTrkh/ZFsynD3M7oiTwN18n8mILovYai
	tMf7ybKByz0pBrosOvB7VaeOggr5duvmFJz50/PA2NAjnvAN3EeQghBN/z9qPG17CVzd9yxoJF7
	iySfvLnO7q3Pj7PPxvHhDecfUStSddXJgNoEDRKxYg5czcdt+G2G2ZdbjlkZjXxNM2pWKWt0s0m
	31EFjUMLh+/Eg6Nnu2tmt9OFEibD9xjGnb219elLreZKigUs/C9wENRQkOhcEp1oxaAWkJnalb1
	W5+zQgTy0Sp6vh13UTkA==
X-Received: by 2002:a05:6a00:138c:b0:82c:21af:a7bf with SMTP id d2e1a72fcca58-82f0c15db51mr7233864b3a.13.1775909521285;
        Sat, 11 Apr 2026 05:12:01 -0700 (PDT)
Received: from sidong ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b6d43sm4993403b3a.31.2026.04.11.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:12:00 -0700 (PDT)
Date: Sat, 11 Apr 2026 12:11:56 +0000
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Subject: Re: [PATCH v4 2/5] io_uring/cmd: zero-init pdu in
 io_uring_cmd_prep() to avoid UB
Message-ID: <ado6jBVkfs8JNmO-@sidong>
References: <20260408140007.8401-1-sidong.yang@furiosa.ai>
 <20260408140007.8401-3-sidong.yang@furiosa.ai>
 <2026040908-certainly-dealmaker-5530@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026040908-certainly-dealmaker-5530@gregkh>

On Thu, Apr 09, 2026 at 07:27:18AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Apr 08, 2026 at 01:59:59PM +0000, Sidong Yang wrote:
> > The pdu field in io_uring_cmd may contain stale data when a request
> > object is recycled from the slab cache. Accessing uninitialized or
> > garbage memory can lead to undefined behavior in users of the pdu.
> 
> Who accesses this?  If that happens, then yes this is a problem, but if
> not, then there's no need for this change, right (i.e. either this is a
> bug to be fixed now or not.)

Hi Greg,

Thank you for the review.

You are right, this patch is not fixing an existing bug.  I added it
because the Rust abstraction provides read_pdu() which reads from the
PDU, and without zero-initialization a Rust caller could observe stale
data from a recycled slab object.  While "stale but valid" might be
harmless in C, in Rust we want to guarantee a clean initial state.

That said, I realize this is a C-side change that is only motivated by
the Rust side.  I will drop this patch from the series and handle
zero-initialization within the Rust miscdevice vtable wrapper instead
(which the current code already does).

Thanks,
Sidong

> 
> > Ensure the pdu buffer is cleared during io_uring_cmd_prep() so that
> > each command starts from a well-defined state. This avoids exposing
> > uninitialized memory and prevents potential misinterpretation of data
> > from previous requests.
> 
> Where is the memory exposed and who misinterprets it?
> 
> > No functional change is intended other than guaranteeing that pdu is
> > always zero-initialized before use.
> 
> This strongly implies that this is not needed at all.
> 
> thanks,
> 
> greg k-h
