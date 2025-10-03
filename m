Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43581A08A4
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Oct 2025 05:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759469367; cv=none; b=eMvKU5ikWSIuRNJ4JAvJEcxSXyPnRh0quK2uJTd0TLYe2bBAPY2ILfUXYxmsfeKEPr4SrCm11GRixVT4dPBJmvipcPOtQL7xTX19KYdg8TsVCoiXvCkaJaQcW8VI8MufiitctWOdKh6UmZ+k8dqxsVGoUgrRkSIdiKA79Wx7e9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759469367; c=relaxed/simple;
	bh=FAecbVfIu/2KfpMJLz5+NVIRF8lakTzCsR7c7STt1QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nWUbqQkGdHDA8Fii6E7Df/6Ds8gocHvdyJ5wfd1bylvErpvf1/bvoytWjzskLatAFF0P/pFQoczQ4HUD4+rzcxbuIjS/4cwyH7FXtixrrsxnZB0YtVY4VL/Q4dxw2ryExGjPozjfHTTxXmCESf3nFAaFKoyObMsNOWlZsL/+X+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VD2qZaCy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VD2qZaCy"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-26e81c17d60so2829505ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 22:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759469364; x=1760074164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAecbVfIu/2KfpMJLz5+NVIRF8lakTzCsR7c7STt1QQ=;
        b=VD2qZaCybeyXJ8ePUVp1n9P2sreyZi4YH+7DUdUxVdU9luMeTDXpTRFuYXdQgNMQu7
         SJ5k6c9WGDqy6Il0GXo8oHm760Fg6ZGUbdT8cZcAEq89Q5LSSd9Cx6KJnLTZpTzZ9H1J
         XS9J68b4C02daCEPTe/buGoPCG+pSUyn8aytbjzPWUpWifaHKGPrLg/zpN1IF5a74MrU
         BBUgzSHbF4l/qrXuwiMt27/oibu3rTGMupzHWfonFbbtvPEAF7ZUqzfvauCbQEAC0vfp
         NQUSY8B8/bQcKpcz5bBgt+QL8WZ0yRnSfd6T7SzVFFZ8FjEfD3x4A5IO593T4hIUxykB
         Lxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759469364; x=1760074164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAecbVfIu/2KfpMJLz5+NVIRF8lakTzCsR7c7STt1QQ=;
        b=sXtxSJcgnwzNpAxPnDQLu6XAbA5aUDIDQ3kWT5tiWOEF4da7oxbdIRfeVIDTmuPYZh
         VXNHHFfrSyDJ3G9MM6YRqApdV5GOLxJcqdGqOSZecXttE+PGKVEE3PABkBAdvG2NK2ug
         CI0UiRvgSEqbdKrzYabU7+bCYOvucH6UivgUFDDSyQEeEQcfxhrWVtwtRqSe2i65ijY4
         BU7vTF1eVnJK+TJ0OZhbnoTHT+4CbcjXb9mvsDY+JzxlNPg/5r2zJAfWTvgWPC4lTnNe
         ZxtuvPeeGtfQkjWqryJXsqPfXmC0lN1bm/YisQ+9F+pr+0npXK+aXsXi7rlBHpiuWhPE
         aDvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9crI6GRG3lszfbLS6m9AoMA5tVGJE0wypPLPyeXDc9ozrdJ3vbvpXXY+kDXO39axFRLDQc7Qbg+e+HR3I/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtJQ1udyr1TDj6IjVTt+D909grLbzYEd5/3MI0gUCve0FAD5jA
	8uiJHSelaYob1DtHTS10cRFkoCNKMw88lYMbrx0ykxgoNPHMfkpV/ADP
X-Gm-Gg: ASbGncsTcg78Eu41DtErQFxd7ik5pYAbQtByPuL1wZyov6Q1XUmisxk5yVCfUAeX9wy
	BxGx6HOi8bpoq+zzro/uQzBeb3Cl0yXfxpOBO7YZYdyMg+DWx7nYFGJiICtbJUvNOLBkZC1yaxj
	L5yrEfM2K2aWrfOZkzTU9RvLXWmmgPjIFRx6qC+PrQ4BgA7tsTCNFIkGnJy67W7vWk8kFI3ny6I
	YVZO2UsrCZnccmcECoG6kYvEqjuYl7HVGIsmQV43YrgQUJ3HQX/quTaqKibHjjqBhjTqNtX1YFb
	gEQiD3Fyz8riQCCjnvU9FlKUOsOkXzssnUFchzKcEYN+S8FkVeYm4h7OE/8HTd8N8PFBDAqZubI
	FzFy9Y3HzR71DHCrHj8KoYWO4Y9KTxeWvNl+pqawAVmQ=
X-Google-Smtp-Source: AGHT+IEsmDDtxcH34zrU6yCLvoUnpVNeQpXjkmSiB1AE5fWsJSBu1loqYdfz+O0NGkUT3RQ1Vtyeiw==
X-Received: by 2002:a17:902:c403:b0:27e:f02a:b280 with SMTP id d9443c01a7336-28e9a65bd1cmr12557885ad.5.1759469363957;
        Thu, 02 Oct 2025 22:29:23 -0700 (PDT)
Received: from localhost ([104.249.174.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1108b8sm37676925ad.26.2025.10.02.22.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 22:29:23 -0700 (PDT)
From: Ben Guo <benx.guo@gmail.com>
To: seakeel@gmail.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	alexs@kernel.org,
	aliceryhl@google.com,
	benx.guo@gmail.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dzm91@hust.edu.cn,
	gary@garyguo.net,
	hust-os-kernel-patches@googlegroups.com,
	justinstitt@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	lossin@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	si.yanteng@linux.dev,
	tmgross@umich.edu
Subject: Re: [PATCH] docs/zh_CN: Add translation of rust/testing.rst
Date: Fri,  3 Oct 2025 05:18:49 +0000
Message-ID: <20251003052826.454550-1-benx.guo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJy-Am=pC07CAWgRSTJ6WLaBdYeg8LQbVDCJp4PYoHaikFJ4Bw@mail.gmail.com>
References: <CAJy-Am=pC07CAWgRSTJ6WLaBdYeg8LQbVDCJp4PYoHaikFJ4Bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2 Oct 2025 21:33:59 +0800, Alex Shi <seakeel@gmail.com> wrote:
> I can't apply it after your previous rust patch. Could you rebase this
> patch on my tree?
> https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git/

> Thanks

Thanks for the feedback.
I will rebase the patch on your tree and resend as v2.

Thanks,
Ben Guo
