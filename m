Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54C4391E66
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 07:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903723; cv=none; b=ONcO9N405ysvXbYUUIukpyzn/Cy+EusXROfbx5V/PTqv8Glxml750+L4iOhcG3GNnyJvIO9GRaUpjKx+AGtID9hL6udCx3VjUIqPwOe0DuURwkd+xKY/MxqpYk/604b+IhaU6BHh6AyOjgcFT7VTt7E030SBff3nKveDppJ/0bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903723; c=relaxed/simple;
	bh=E6CPfq10e44rWJMjsVyNFlJobh2++gPthf0oPB650/U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ROMkCI2qn8+1svNl9Tm9uLUFmvh5BY/4LKE5VwmcDsGOhI3mKN6GRQCHjivFioVeIReqvevydbp8XSOsHDZhG5c1wGUqUlFLJT0cV5r+hY650EuPMoxiV0WplVmGy2ww4sYSUNvnIiUXJ31ICsETawP3oRHUeCl645Q2g+6riXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r5qvv+Ji; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r5qvv+Ji"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490b8adf8b8so37805345e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 00:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780903721; x=1781508521; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=501MfalpIT6BbXjmjnyj7T72VOjdUqshkIQi/rN2yjA=;
        b=r5qvv+Ji16R3FKXMUd4xR2zwbwMTuMb1RnIT98n3PnoRjd8u9Ve9bgUXrigw4ag5KV
         XLKAmHHXvCH6zskyoNUz+X2nl3Ge1ZyMdic9gCRO9GTarGnzTmGmOd4MeCq+jGNuswAS
         bdIZ1+MqunesvTzJqIaPksJ4O0yNptE3AKd4Qu3JdI8CzBwsG6pT/mUrEElnb+bnnEMq
         M9svhIqzd49f9TdBs/WQecCKp8+hAMhOCmdpFpjaKgecNp45SniHeVfuaF2L4ZmcCpnA
         k4XsmrFFKjbTOgDKAn93mWd9r507S21zLYZDfIH1n34xx40L2AuIptdoqx7Ho3adn9Hg
         RoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903721; x=1781508521;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=501MfalpIT6BbXjmjnyj7T72VOjdUqshkIQi/rN2yjA=;
        b=fA47EviZgipt4F0toGA5uQJ9fzF/n4O7FbndEsKX/C15iGypILMk2QkxySmFPiM9Tj
         aK/h5YPDsRNaXCtyhLYwMqNkaIbHTKVT3+iqtzRJfQkskVERvztOUZBiKthhzOOQ4DS0
         joptMRpLobe3KsI5jpxDA6w8uBO5SKc9wg4/LZwX+vNh00Fv99nUsHv8y05kRiG/JfLS
         j+8yYA5JhJX26MKBR8NDhaO9b0SzptHyaQN58YDuBPCz3ktBf62XaAw3igujA6zmA315
         zVxEIoz41sDZ1V6PwTK9MyV7c0B1D8dBk87ZHfw+elJybMr7DrAMxijiS/Vmb+QRD7ih
         mBsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8R106C7rqlpLTnJ749MNU0kO/EMJQgctrh23AFuCHhwF2lXAfUo0iHv+fSDAgXmV/l1KRaq/0bEgBAF57x6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4uj29OJP9xtdO128X00xTMkuy2MZztXEEetubQqLLPnSZ6IpM
	Hv+3WlXdoj5geJQeXN14rY1cNJuRmD7MUce8wgKaOpHpCGDfY8qZ0ffKr4ND/4emr52xcoOR8Kj
	+X/LtV6Ha81hnz+eMcQ==
X-Received: from wmby20.prod.google.com ([2002:a05:600c:c054:b0:490:4995:a7d3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c493:b0:490:ae52:499c with SMTP id 5b1f17b1804b1-490c25f1ab6mr251965065e9.21.1780903720959;
 Mon, 08 Jun 2026 00:28:40 -0700 (PDT)
Date: Mon, 8 Jun 2026 07:28:40 +0000
In-Reply-To: <20260605-cpu-helpers-v2-2-0ad227f0d91b@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260605-cpu-helpers-v2-0-0ad227f0d91b@kernel.org> <20260605-cpu-helpers-v2-2-0ad227f0d91b@kernel.org>
Message-ID: <aiZvKPFCkqJUsP0a@google.com>
Subject: Re: [PATCH v2 2/2] rust: add a wrapper for the `nr_online_nodes` C function
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 05, 2026 at 02:54:57PM +0200, Andreas Hindborg wrote:
> This function returns the number of online NUMA nodes.
> 
> The wrapper is needed by the Rust null block driver.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

I guess the NumaNode struct should be moved to this new file.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
