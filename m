Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD8D1684BE
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 20:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782505614; cv=none; b=V45LOJD6q0db9HR7ydEV1jWur7KSv+smc1DCliUv4FuhVxIZwwtPXjSlLEOvBRn4pPkjyFjy8xxSoET14RvtiX6ZFkPblYhQMkxrY6v1DIbuTJV1pjaHy2Md1/NFFrymJcOCi35b0hsLTi9tVnR5Q2hHTZwQUt01qHOjvVo7xAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782505614; c=relaxed/simple;
	bh=btuFgTEw0REOFIy4E0WYoAD5GrPsY6+Ubc6FSSkUlCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOj8hGTt0z4fyQUeH8CQ9EONGYgxQOk6rXLMti7oV33Djljg3XPMRDJjC3u9VsKKMMEFo3srk5Q4Fce7pR/RIf0FHjYHLQrnCANsb7eoshUrAgEwSP4KqITFzXGqjbbQ6e2c35tJpjfL36a7PKMmhCJ7XRrW4BfeIwM4xeYccRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gn+6fCjl; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gn+6fCjl"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c813a45a65so2405ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 13:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782505613; x=1783110413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AzrBRNLhR0I6k4uRpbreKeFVMARQYKyxgDfOLGtLkVU=;
        b=Gn+6fCjlGh+n74Y0GTb2YirUMeOOdRjVX+TuBBfBG1yCVyTF03r0qJbs2sZWcS7bnL
         +KUYii2Iv3l9x/e/ipvqxgzvqwLWZpgxx7DdAtbINl/AOHK2MXr8enBwFApkT5jE3S7v
         EYWLMS/gzj3Af2LWiRpXHJJKrhHTEviPjDU6K143sOgtiyAiLH2WppWM3LCRpVw2lm/O
         gs2iNhCHjZYUVGN10vWZYAO3fjEdPpx3dWOP/PmdOCMWmVtLJMT4pBK9BXNVlEbcduqr
         Vb0ZLw2wTYuoW2QTLEACpqN3kOOr7LXyRzvqqjoUdBix3EGJqE/gPyeCy0cgVKKA9QAV
         JiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782505613; x=1783110413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzrBRNLhR0I6k4uRpbreKeFVMARQYKyxgDfOLGtLkVU=;
        b=Uxt6eZQVmNVlFHJ1n97MCt2uRfltNmK9HIp80cfG+xeZ/QQo7CwEd8K0FeWQLr5qBH
         HkWWUkoAte7yL3kiROz3BGMj6nxKh7T2ektS12vcCFaI1cssB92wzwbw50mmDhw3zYZL
         CBbMypZVQ1AnBIiMck2qkTR7rH8BVNkEy4a/0FKlV9m7b9URddcF9gCbvGgVPQ8Lisjo
         Z3mPB1UE1sBbyOq84CN5fyQ9j1ndothpLAq3ziEMZ49A4qEsvkiIj/48orC9w49vItzK
         4jJLmiIzJnZEVGjOWT/yIT4WFThoq2EZVt0p9iC6IjyR1AmRnjCKYtBfaR2mvNJpuCTG
         w+Iw==
X-Forwarded-Encrypted: i=1; AHgh+RoH7AKNRvPzXeVPE4E+yypNioLHLwNgx/DF8ltBImSwIJufSllaJ80xkFoqXEbfO61TIzh/HfHcdS9euf1Vzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfa8ucrSyzmNHjdPXaiRX7i88YmIUBYdCkzDGdq+26SeQ/ET8d
	V2jODw+IZhw0yCoDPZunRxhRrkJSaIdNnzdPWEj5stTB7aSHgHdZRAE3JRrJPmUhzw==
X-Gm-Gg: AfdE7cmF5XdWkGmfi8cDQd51jg9IATItIuBRu5Mf/VIHUU+QcODrPCZr3Pdxo7NYAVt
	FN3GNHA1lG3zoGckfZUFz8J59ahsUDBZeWTKx/5bFlzoCvpLFPZMrK4vGNf5S8zEcaK71vvDArZ
	vvqxeVWqXr8en51ni53DuuCOIaTS/ly+vwsJc+637c/y3M1RjyGEhFLkaq8NohANlcAtr7anh4z
	NG8CWljD35ZBaIEOQJuoJVQ9jglhNO05F0vKzejxVqa4CC4T+axw9dscT8aS7+HKQcXWs5d35Nx
	JpnDHVxa+mO1peSv4/NIMM7z6HQdHkBx28+r7f154jJpeOjE9pzcwxrSRm4rZjPWgCX+KFgm015
	bvY+/mSI/Bpj8ayUD0NElklQN/ftBomYL3N8ReKKY+zilTuXDMSFJaUlKyQG2jPLm6Zrh6MKk8H
	NRHsjhlKksEevcdY1R3WEIHC2Uf30Bcp0/95RRwCVx2AGlTUuBmV2hLqzShqme7HbscknASUC8T
	52ikoB9TKiF4ECJYbxGWeOffbNrmNrajnk=
X-Received: by 2002:a17:903:2282:b0:2c4:3ba1:9b26 with SMTP id d9443c01a7336-2c9a235caaemr524215ad.0.1782505612571;
        Fri, 26 Jun 2026 13:26:52 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm46943405ad.56.2026.06.26.13.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:26:51 -0700 (PDT)
Date: Fri, 26 Jun 2026 20:26:47 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/5] rust: sync: move lockdep types to
 rust/kernel/sync/lockdep.rs
Message-ID: <aj7gh_1_6g6a5kHY@google.com>
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-1-cc922f544dc0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-pr-ratelimited-v1-1-cc922f544dc0@google.com>

On Tue, Jun 23, 2026 at 03:38:04PM +0000, Alice Ryhl wrote:
> The lockdep types are currently stored directly in rust/kernel/sync.rs,
> but there are starting to be too many of them to keep them in that file.
> Thus, move them to a submodule.
> 
> For commonly used lockdep logic it's useful to keep re-exports in
> kernel::sync, and this also avoids the need to update any users.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Looks good to me,

Reviewed-by: Carlos Llamas <cmllamas@google.com>
