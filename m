Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D4A55D884
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 13:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961231; cv=none; b=L0stxoVn4WhZOrxddst+qw9o61hBviuYWpUUR7Q0RrxZ0ymq/8/7LYtqeA8jf15wIwSfWj5AhQzCL+ii0oabHqq2kcUxau/2453oXRVOqEK2jpyTcDTtAM97cO2VU8xcReGWOI+9x+oRdj/rR3WiyjItcNWYLmnsT/zs49zQVSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961231; c=relaxed/simple;
	bh=JmZZow6JqW3NBqsHxtufs2P1v3N6ATJnI2hLa7ngrek=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lH3dJbtLU/sG8rjqRihBu/Xjoc6JIBeaEvJ6Y4PNrmeQQIeDc5/VgWJHDIaSUIJHiTTdf0+drcIZVAV21FruBSxGQaTqLgwTFMXW5HM/uyc5OEFNLDRkFlSPzOQrvhimAJdFak9qBjyepLP9JeOscY0c1AQRXAn9w2alOuBhN4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OjZ2y9IW; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OjZ2y9IW"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49545071724so51998525e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 06:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788961228; x=1789566028; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUnsPGbfxI/oNqTuZjPU75bB02Jddl/Eah7Q2ppuGcI=;
        b=OjZ2y9IWiy9UOO2Au7KLxNpC0GMH0QoRGPaJd3oF4iAvifIAIlgNhjQ7IGVhFFWl+G
         hq0y3H/gBngXQIwCTe9yhsxEOxECULjJAgSxYnqb/bP2zf4QpLkU/NtrGHDWDgpVmnFO
         3kKftmmDhipn4a/7m7wuuHwTp5k1grq2pjmEn6OpuZ8L+leB6OYrHQp/20MyO3eiuqg/
         f5Ak381FDBwBYmfwTkdTL4HeL2Vv+hRmA8fpNFOpIB5ULmN4ZNUVTg/mcszaOSJWN9xo
         yp92/yx65pZH8QRWOtHeLxTgFibxIhK+nyFSYbh5eCFljzpbncCe1Q8z0NK+EQWgpcVF
         971Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961228; x=1789566028;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EUnsPGbfxI/oNqTuZjPU75bB02Jddl/Eah7Q2ppuGcI=;
        b=esOPN3HMa0doHqCsHkbH1oJTtc9vIF+1/wKQeZ3M0L9oZ+50dXM7XwDXXzCRGpM9V1
         HO/T43xyqn42Ux5O1oZ2Z3EIHzveJCNKxBp4L3FcTqv70Ak8ttYJwy66P55byMp7DJXX
         pfEn6CoN7jsf6AtHwjxXqxF6UtLhfCIec9GuUMHs9mKcNlX9pgQCfvSqEkZQTy25NVYU
         xXh0zStCkjmEyTaD/Vm2DHn+YctpRB6RclIN4koMLYxitLFqqndQ6JrZdf4kVC16ToS0
         40Tf889naSJw8EQ8j1ZXG5SIb1FJOMYBMa9zQ3NjLcaL9W/uMPxpXAq/I4pqZkWylrqp
         i2FQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYxYbeTyq5fG7dYbShJVTuTvMRqAAUE6MG+cPsQdBIBc6NtZEVGROoFH1BP/XcRgAG1V4S8q3raJuOZ6qRfw==@vger.kernel.org
X-Gm-Message-State: AFuF++kECCBzXFUBry3JNIFWjuRgBfpVodxVA9GNuQps5q0n9bcH31WP
	GWp8XOw8d0O2uRErR+9UcpaaPsFw/7Iobq9pJO6hWiVurKmiU4W3hm0KesJinyNXj0hFm0MNGO2
	Fovz3fowg/fui+w1ryQ==
X-Received: from wmom19.prod.google.com ([2002:a05:600c:4613:b0:499:c849:1518])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4585:b0:49c:fc6c:be16 with SMTP id 5b1f17b1804b1-49cfea09f08mr307952375e9.28.1788961227435;
 Wed, 09 Sep 2026 06:40:27 -0700 (PDT)
Date: Wed, 9 Sep 2026 13:40:26 +0000
In-Reply-To: <20260909104313.2453991-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260909104313.2453991-1-tomo@flapping.org>
Message-ID: <aqFhykfMYOhdcqSv@google.com>
Subject: Re: [PATCH v1] MAINTAINERS: add the Rust workqueue abstractions to WORKQUEUE
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, tj@kernel.org, a.hindborg@kernel.org, 
	acourbot@nvidia.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	jiangshanlai@gmail.com, lossin@kernel.org, tamird@kernel.org, 
	tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Wed, Sep 09, 2026 at 07:43:13PM +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> rust/kernel/workqueue.rs and rust/helpers/workqueue.c hold the Rust
> abstractions for the C workqueue API, but they are not listed in the
> WORKQUEUE entry. Add them so that changes to the Rust side are also sent
> to the workqueue maintainer.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

This is being fixed by:
https://lore.kernel.org/all/20260807165252.3849875-4-dakr@kernel.org/
