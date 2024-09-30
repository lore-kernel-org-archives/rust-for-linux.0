Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF3815C15E
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727683006; cv=none; b=kYQ6WwbMI72PlZArJJmeqyjlSyaUhZfcDPaXBke4CcCWNb4Yv0ZLA/4liOjz5N9RpD4vKg4W3eDB1DKbFEnMKB19d8ghUBtNi4fVzHJ75mLTi8noeXqy6ikMSznRW7aai18a5Lqy22PS7dWRLk/fOPuR9mUrhYsBJEaYHqpUL/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727683006; c=relaxed/simple;
	bh=opIQ+15UPIlBq6oK2ZBUTlibM3yyXEGkuISr1NYeRDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDXH2jgTJnCCml4Zpq7cZZ3TDcVCbV/WoJ9hoHCRm5tMgzl1NIISWG3pWNQdZFMK+ElktU2s0XU4Cu6qZ1D8ft+/qMr0jG2P2PoStJcNHLF6hUCJggJHBWNVKMSts7put3vrY5m3c02ctQkEX8T1tLl8uoN7wx4aehygHYxT7+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nrDY5IMh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nrDY5IMh"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42e5e758093so31995425e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 00:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727683003; x=1728287803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opIQ+15UPIlBq6oK2ZBUTlibM3yyXEGkuISr1NYeRDM=;
        b=nrDY5IMhRl9eMFCP23ybdONr1wqPlqySshnAc2109Qjgzu6K7nj1IWTRvqr6p5KVUb
         qeJNg1eem1/eX+2WAVkDTBk5Mn8iwxB6/6dco2eyKtC/K8MBGy7H+5aKm5MTLIrHP4Am
         gWF6R+eBnDOnPBf8MMvrNmERS7ezcIy1L5T3M91Ou3sbi8clZkwqBynJOGqrEJCQrHp8
         VlO6eqjCuQdBYOjeWMGGWdDeyAn/xY+4SPCcFIvqX23EJqYU2nE5gfP94tHuFNbB2eqm
         PRz8Tx9xmvuXNa1/c+EKLGw5tTJ8sILRNexVIuMFdKuhfHna7fntFOr17ZtUubx97FTj
         kq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727683003; x=1728287803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opIQ+15UPIlBq6oK2ZBUTlibM3yyXEGkuISr1NYeRDM=;
        b=dsczrC48YTIlMd9Ir9+mYlCuBVCw3X3PufklZpxND+0E4v2Ue5lHYNL+oGO/7PomYX
         th7uDd7mxaP8Pycsr47twlrwSBXyD7iPAHlD/pTZeDNEgx4CvmkyUwzJVpEVRJJNBRy5
         9fhnRMgWrg13bLgn74EM0LRXcuKd+jX/h8yz2gz+UVrXYine6RDfQl8jmi5w9U6CmNYB
         xEtGInYoHvTprM4wrYMUSJNcF63izIIHQJA3zoMz8QXve5EBwLAf1yvD1qhzs+bnfmj6
         AYWLus4zkXAA82M5RWI1BoCjoLYbM+F9YsDkGTjeoaDamoy8NNFoC+UXGmGBnXG5rB0/
         w+3A==
X-Forwarded-Encrypted: i=1; AJvYcCXxX/aoZ6dAzTPd5LFtfWy/xkWnq/fM92wURpsGw5qzTe0XeTwnK9aKFOyJHxQ1Za988B8sUdWtcThQ5J+1sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqTCNhLdlp9N1QPLxEn3EMUSt7nVGCsai09taeWnc2DXKcBoXu
	wNu593z5aGFBO08h1ZsyBN+YLFd4Os0TNs6Nd4bm8IPKgO12mC/n6w2F2hPXSG118LY5r9SwUDz
	EnM2J8BKqLZAxaKuiM+265/hdChpcKIQhDrep
X-Google-Smtp-Source: AGHT+IGhGaW1zqKT8yn05vWWEP8GLZvyvXqiwd5BvKXnlWTUr88JEBapDb2DjS/xyOHesOaTzvQckUMnBcjk8WP2CBQ=
X-Received: by 2002:adf:f582:0:b0:374:bb32:656c with SMTP id
 ffacd0b85a97d-37cd5b12572mr7051985f8f.39.1727683003348; Mon, 30 Sep 2024
 00:56:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918212052.8790-1-nells@linux.microsoft.com>
In-Reply-To: <20240918212052.8790-1-nells@linux.microsoft.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 30 Sep 2024 09:56:31 +0200
Message-ID: <CAH5fLggAVUDVXOm3foVnLwyp5=dZVckut87FdvURgXwgZQNYLw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: types: Add examples for the `Either` type
To: Nell Shamrell-Harrington <nells@linux.microsoft.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, tmgross@umich.edu, 
	linux@obei.io, kernel@valentinobst.de, kent.overstreet@gmail.com, 
	matthew.d.roper@intel.com, kartikprajapati987@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 11:21=E2=80=AFPM Nell Shamrell-Harrington
<nells@linux.microsoft.com> wrote:
>
> Add examples for the `Either` type
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Nell Shamrell-Harrington <nells@linux.microsoft.com>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
