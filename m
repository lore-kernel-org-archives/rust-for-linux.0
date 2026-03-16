Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17A517D2
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 10:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657510; cv=none; b=JYlXdEIXigVCcjoMhTfHeWqjhUDC+P5pjf0S2bUujw5tNoR5EO4HoCd7qnhMeEU+StWi6HoqUmb9c/fElmOto0Sl6BPvP+jAAm8Bly80lUdwhyp+6hitLGtivIErxfZclFX4Mw8ie434rtz7ZibkSVkkW17X8nE6j7PtdYDaibk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657510; c=relaxed/simple;
	bh=fdiOOmRC9/5MjW+e4V2P6aKLh4fLwMKxCk4R6QAyyug=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tEU8fjrku7YVUEs2R3KqRFe3Ydm6/gsrzqoKsN5BiJxPl2PNLKiEo7HkIDiId+f9wP24GkLgQ656/kKUYMTbSH8nah0YKXEWAhpkCx+TCwFJqij8BDq50eQgm7P3J1DYvNhgFQpqzP37Qm8ELKhENZ8yap3i+zT711m64l/FXA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iEMKBsWs; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iEMKBsWs"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837bfcfe0dso55078225e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 03:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773657506; x=1774262306; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9SXYFbMaZyd4uq2jz5cd/WSU7rtMrzbFvz22tvMMpB8=;
        b=iEMKBsWsTUww246c8LavovqYfT51eSnwmd9ei8qafk9VkFx9f/N8SRfq1JDU+MdGO9
         uU99kDM02dtv0NQCvXN+qYwNs6YFKXb3t30zrUnlggLOp8j4DPrdME/9j0iejrDTJbFO
         7+q2BHA4+UpbqV7dA++nbwSHCkSgTlV+FVFsNNasLDI+RXP87yu4QGaotdL57rdFCNCk
         TakWOx5kl7zcVSg8Dk+n8h53P40jyJxThQM68ACIN0bgpDmMOpfKICQViCp0p1i/fuIv
         kFBCtbAMoK2fLEFoSmqVSpC/CRE7+zXVC3YhHVYOkv2xBrN2KJyH2HnJusQ8ZIUjD13B
         0+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773657506; x=1774262306;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9SXYFbMaZyd4uq2jz5cd/WSU7rtMrzbFvz22tvMMpB8=;
        b=rrFTA2HxIFrCaVa+F4lsSaQ1ElfaXKbomr1YOnrmAkIPgnFtajrJDnu9iOPYSj/ix3
         NGf75FEic8b1b31E3eTvmV02uI+vrlAJGDSVOFpDJ0XPbT1FL3KW3YeFaMJCk6KV/9Sp
         ZDDgA/iIrcA42U6AQx8lrQbsMFkWcSQR+uwardJpscWO+2QacyY2QXd6lc1hJhia9sC1
         LNYahnmrEfCABTBE/y3o7xRVaU7HW6ApVUi9zt950fwr6DG4nMVY7cJN2mJNy75X2yCA
         9a0SNW50uU7FOHfCI6UdEbaepe5f75kWbUBbe6oki/RT4/Hld/La3kAf2vO46GyqerpX
         poKg==
X-Forwarded-Encrypted: i=1; AJvYcCW/zv+FjjE3riEXPd7Ej9FpDllUvcb2T5tqVUdBctenAX9w8qVmW+D8S3BPGFAvQmwykGNodloRk4LybfQKMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxULeSMHxt3+9/6s8N/Lcw7PaZq/o6N1BdpZv+HD6zczThZivWd
	WQ7nNNtqWzo9mSwdE6oG9mcasIgNjEzjDRPp7UQ71Xu06GreE7mviLL366aMoIPFIDIYK2xiE3G
	WJAPo7sjCM2Znv2BVyw==
X-Received: from wmco2.prod.google.com ([2002:a05:600c:a302:b0:485:3b4c:3e34])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a39e:b0:485:3ca4:4ef4 with SMTP id 5b1f17b1804b1-485566d6ffdmr140263405e9.9.1773657506198;
 Mon, 16 Mar 2026 03:38:26 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:38:25 +0000
In-Reply-To: <20260216-rnull-v6-19-rc5-send-v1-13-de9a7af4b469@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260216-rnull-v6-19-rc5-send-v1-0-de9a7af4b469@kernel.org> <20260216-rnull-v6-19-rc5-send-v1-13-de9a7af4b469@kernel.org>
Message-ID: <abfdofUwfh---inT@google.com>
Subject: Re: [PATCH 13/79] block: rnull: add memory backing
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 16, 2026 at 12:35:00AM +0100, Andreas Hindborg wrote:
> Add memory backing to the rust null block driver. This implementation will
> always allocate a page on write, even though a page backing the written
> sector is already allocated, in which case the page will be released again.
> A later patch will fix this inefficiency.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Same comment as elsewhere about parsing booleans with kstrtobool.

> +type TreeNode = Owned<SafePage>;
> +type Tree = XArray<TreeNode>;
> +
> +#[pin_data]
>  struct QueueData {
> +    #[pin]
> +    tree: Tree,

Why this type alias? Seems cleaner to just say

	struct QueueData {
	    #[pin]
	    tree: XArray<TreeNode>,

Alice
