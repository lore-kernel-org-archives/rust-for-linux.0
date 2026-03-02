Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0602425CD8
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 16:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772470071; cv=none; b=KY7PUmFABabLQAC7MnRhY1cGluSUUJ1tI+yPYOToeCmrzkmxufReXc4gfnwN9e7Az5syaWwoAg0ZdQWebiX2nAVqvYeLVN7gdXf9JtokZiOsZ4dtipKUK1eW2Eag0IzALl6CEJPD6Fa8hlDSktLDugeN4qmIsVceBS9B6KNDmCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772470071; c=relaxed/simple;
	bh=DoVwBkJHjRR4WVrijUu0v6PjXF8skgMegaPq29y5Btw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tFtCHgOAVf39zFyekohJXeEQEQq8y6R3iQgv7MfOqwHqvtEYOikWKUyhMB1PtcKWf9Bxi53BupL5Vg1HZ5oS05PpzEGhC5mg3pFOLjQAfbLRzNeeQNuFs+4RENAQ8nHx4dGxFSVQxLhIWzFAfMu4tH0pXffap6uMeU7lLWXGal8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TiDB2uVW; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TiDB2uVW"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837907ec88so54172735e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Mar 2026 08:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772470068; x=1773074868; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yaWqpVdlDV9VaHjIoyw0LdeLAZaCz/qIWYw9AXU/0oM=;
        b=TiDB2uVWnbDep92WYvsV59+RbOHtl30KJTjZ1OwHAX78uJX6YXuetYkXMNCAEJ/ilv
         VHBzCw91s4BvnGK2ZIxtosHImH33eD5jzjOwLbMFjw3clTlgGUtZI76nq97xVn64TBS3
         hifrGhCy7OUoMjLHPbhBaElACXts5Q7uIdXQOK8gN98Jcb137/UJZ387hyKFmLB7s4of
         RX6el3NM5lZpl+1PEuLeiVk18qFiireu/5NTKsvEML5uWax9oF69a1dbqjN6Zusp5AM3
         3gjTiXNT4TY2xL5nBiY1Y5LD1bDm6jfU3GKWEStM5oEZKuS8VPb8VAgQbd7RdXU4Lxal
         7I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772470068; x=1773074868;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yaWqpVdlDV9VaHjIoyw0LdeLAZaCz/qIWYw9AXU/0oM=;
        b=iGpA5GxP1TRbJPZfbFSs4q4u+tZzqxPI3kjmiqhnDMMTZ7dYmcAnGW05hJiuNLtNB4
         Rn0gMMGawiyuKVtjPw/I+4+yzN/aGBXPgkTljYhJytwSSBFqbRJjwAgKkKU09orQppQ4
         jP8i7htBuiINr1GVatCP69Kn+f8e4uae9eDFVclzfTIULVi7OFpeDicj9jyiGIW12/3f
         PKsYZs5OeE7Il0+acVg651HWvwBsGCJViI/hV+sE9jXwPD390HMDXdE/GBlkEMJwPu87
         a4aSxB5vQqsrytBA8hCO3Wsu8xFfPiX7Y3zPETf9j+WfpToevLP9StroG/Ss0joJ4IIu
         uPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZHUKZS7c7FGK2jxiab+UOr+AfB/a/3w5rbdTgFU9vx0dh5n3SB7rQUCBhfmNIug5eF79WiiDeu4UuvcO/2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFMzsbW37a0hDww0OVVHB/Y3g1KShZ2HZSoz3S2eVcRFigm19W
	8lQqkojd+pdIz97mxzmS3pRPBdOA1yRDxDYRM3BUdqANOqTwW8Ai601lsANTuK0/OLupWqRjTPE
	Wlmod1wsQSqmN1/oc/A==
X-Received: from wrra18.prod.google.com ([2002:adf:fb92:0:b0:439:b77a:b852])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f83:b0:483:8062:b43 with SMTP id 5b1f17b1804b1-483c9c031e6mr262504225e9.19.1772470068114;
 Mon, 02 Mar 2026 08:47:48 -0800 (PST)
Date: Mon, 2 Mar 2026 16:47:47 +0000
In-Reply-To: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
Message-ID: <aaW_M_h8vAUpUyQG@google.com>
Subject: Re: [PATCH v2 0/4] rust: Add ARef support for work items
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 04, 2026 at 05:40:38PM -0300, Daniel Almeida wrote:
> This series adds ARef<T> support for both regular and delayed work items. 
> 
> - Patches 1 and 3 actually implement the support in workqueue.rs
> - Patches 2 and 4 adds a corresponding implementation in drm::Device that
>   dispatches the calls to the underlying T::Data.
> 
> This was tested on Tyr, and is actually needed in order to obtain a
> &drm::Device when handling work items. This is then needed in order to
> allocate GEM objects inside the work handler that processes the tiler OOM
> (out of memory) events. The current series sets the stage so that the above
> is possible in the future.
> 
> This is currently based on v6.19-rc8. I hope we can land all four commits
> on a single tree, but otherwise let me know whether I should split the
> workqueue.rs changes from the drm::Device ones and rebase accordingly.

I noticed my Reviewed-by from v1 was dropped, so here it is again:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
