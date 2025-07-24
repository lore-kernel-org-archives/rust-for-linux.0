Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DCA214A7B
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 06:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753340291; cv=none; b=CyMPRhYWk+TG5u/tloFJGGCbVijeoHRhHav53y/UnehU5CaHMzW4i6SMf9c+Xbyt3NqDptVsvPlBEJbu4yyNMRb3c1cMC7KKm9gz05GpT2Vasx5y0f+KX9ZCm25ibp4Fb5+sIS6iJjUhcqGkxi0lK/qZT015JDdHDSGppoW3ysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753340291; c=relaxed/simple;
	bh=05QffvNA4rPYtwhetDKRaPeLYaWhowv2bUecmXeEbFY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dbmtjno6k8BNQnr2SANa6JWzzRQKMjvgr5tJ83ObHhQjI4S6ZWtea43kpx+TaUP0Sz0r+4SM3QMi1BQ1XD/jZIj8yq6yGuDx9VG9JXsRFV5P+C+gq1mFdPqrjnUuK8xohpBh99zcrwL8hB8bt36w49i9vbcxTwpKcqqNSuRMsIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AdFQxbw5; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AdFQxbw5"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so443757f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 23:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753340288; x=1753945088; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xtb705LuhrRNByO7/3BfyZ546FH6Oxokz1gvWxJrhds=;
        b=AdFQxbw5PpbqaLtVcPuRvaYStpglZZx47HD68RR8pP5IJb3nA8C5izv5mwqPzM9Ixz
         1RNUu6HUxxcNcZJ+ZCWjJ7nvwAjWH1bMtyJH8oawdJO/gNsJzgCmjFERbptUEciFLm1y
         3gYSDZc0TbzNZgI0uORrokCFuO0qDoLYggMqbeUVsjtTSwT4K0C75h4PAl/D+RdgLK9m
         M0/IWtM1GLG+HTBrE+FfUjdTldgkoEl3RX5sOj+fvD8cX/h0lrNp8sWjOBv2yJXbSLu0
         9veYtJS3lkeqHErqVn+bhSN9hRdwSetlXLqBtTuPVC1kYn0G2mysCYYTIBXSFN6CFLNp
         1R9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753340288; x=1753945088;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtb705LuhrRNByO7/3BfyZ546FH6Oxokz1gvWxJrhds=;
        b=NJoMqYIsdz/VDTkbIR2nlcAq8Fsf8oDY+5dXLe/hdEAKoup33kM8PWAMqGqv/PtWn/
         2wvlIqrRnPlDVh7PoV8UhhOuALaPcIavvZdOuGa4Rq4HOI3/ZdfkphrcfMZWmQMgKXS0
         ohaLhf6i5qsCl6jzT2r1DWXaiXRysjOxjZ39sV6A+nkBI6mjJMT16xk6qWppE9TyEO8c
         p9ziL23PG3tk6H+v3UtWzfEJzgQ/uGwI0OcHGWhZCNNHxjI7Aa9/JW2a2ixeWmUDiJ1D
         2wZrq4DETUIk7Cb1h929aa8brWsTvn3DNWOruqEE/JwyPhSrhWqa8icWiqZP0o610K1w
         1vuw==
X-Forwarded-Encrypted: i=1; AJvYcCXeYj/oJQhKrhNqdf5yCPL5ac485DyBJnXpGPSGyZtXfB2K2L8DQyA6LVn8uRPtjIJYUBQMTtZnv2CUjtUujA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUl+tOcG5c1MdhTR7OH0u7TholEtT1zyvVdRvZ4aT08YVH4o0G
	xw2MlMilBt5D7RfgsThQKAv3ELziU72Z1ToOb0qXBueUFZ7cL/5koxoKn6IZ/y1woXsW9aozcH+
	vlzutoa4lhfYV0lDCNw==
X-Google-Smtp-Source: AGHT+IEscII00uUqVEaKW9L+u9v5p7LZ0jXP4YOUb0/cjjeMpcFBP7Hs7hcJ+xS29P/rW+NICnSqgvMZow8DgyI=
X-Received: from wrbce13.prod.google.com ([2002:a5d:5e0d:0:b0:3a8:2eeb:874])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5c84:0:b0:3a5:2cb5:63f8 with SMTP id ffacd0b85a97d-3b768ef3a6amr4464231f8f.29.1753340287875;
 Wed, 23 Jul 2025 23:58:07 -0700 (PDT)
Date: Thu, 24 Jul 2025 06:58:07 +0000
In-Reply-To: <20250722150110.23565-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250722150110.23565-1-dakr@kernel.org> <20250722150110.23565-2-dakr@kernel.org>
Message-ID: <aIHZf5Xnb4QFLuKi@google.com>
Subject: Re: [PATCH v2 1/3] device: rust: expand documentation for DeviceContext
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 22, 2025 at 04:59:59PM +0200, Danilo Krummrich wrote:
> Expand the documentation around DeviceContext states and types, in order
> to provide detailed information about their purpose and relationship
> with each other.
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
