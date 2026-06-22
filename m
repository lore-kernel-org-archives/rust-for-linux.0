Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74E23A2E2E
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jun 2026 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121471; cv=pass; b=trVlLZckB3zkvInxQ0FOI8/eNJ/j4jKs3okhzniveLOuSLQy70Bx7ELfifRSo4mRBRMXvu2vNrbu8Vcrjlmv1L2mDlRwAXI6xmzLRmPpI5sK+CEo+Cy09R7viJpr7FbG2KW2TA13ZgixSltLZkumY0hevBmByEuwrThC8FuQKuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121471; c=relaxed/simple;
	bh=kV745/KnC4AVvohHQZ6KvT7W5fptsCbNbjtoVOi09tE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DP7fOLqAkvIXVlJw+qIHTU/A+Zz5Rcgd3WMZ+7v+neWDqesoErjwVjdPlweqciqE2kip/JQ52HU47R9wlG2NrfEm1qYj/97Hgsb1yVf32ZSd/eCHo5zg6QBI8ler216TdnFX6re8FpSB9OKINBn4lGsrX/y083e6O3FnK+6akXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFymizwy; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFymizwy"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bb87c90deso502648eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jun 2026 02:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782121466; cv=none;
        d=google.com; s=arc-20240605;
        b=MOeR+WpWrNrtXfjtTL47P+Lw7ltRyBE2y1I5e1PPeT++Xe3sV9SsS022ycK0f+UpRs
         OlF3RSKsg87+Nav9KCa4FvmNl4arrGuJg/7BO8ZcMQmUWU0Nrf1krUmR3Zwb6CM8sh7I
         xYt0mnQ2l5tdXBlmCcwRR1SeqhTSNzVi2FAMGNbiNppnFEQgBOT1mexfmz9yCRnUsBhX
         cpbHDC0LF3yb/LMHHuCMxm1txUacZTBdY0SU96aSlLQIaTeYQsCTQ1GzYuuzJpy5YOvr
         7msCzH+5wSLWTf9DSVA7uUn9SEEEq13Mqf+51AKjwidJ89xSp099/Cw44yzx7F1hhxlJ
         mEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kV745/KnC4AVvohHQZ6KvT7W5fptsCbNbjtoVOi09tE=;
        fh=b1P2/UQdWLMCjSv4nsWG9r0VixQFzras/mCZsZ4DkOw=;
        b=ENOKpUmzNo91pABeocZBnow68p4Mq/JlOaKwrJ0c1u/Xfs0nrBqCg8Z+40NxgmJKdY
         6mBMaVN/QcGtbYqwocQA1mT2ueSGqm5W3F+5ewzjOaSvMrsHWk2Oi2H6PbFC6MlG0TGy
         2+FTVO0oyJk0bM1tSiJDbOr819Lqrq9B73B+a/ovuDE/5j2Q7V9IBTkvPO25RCw0NZjq
         YvazP0vYF78soZrUpnCnxTRkSt689WnNNh5YcIyEuJZuMUIzR1NWUuT75qUjNeVIQ4XV
         tG4GYmywjlCua2VwGoY9YdUjacERIyBP4ZgHVD/wXmjhOQLgxvw9aQ1B5DUCf3pbwbhS
         Mwdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782121466; x=1782726266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV745/KnC4AVvohHQZ6KvT7W5fptsCbNbjtoVOi09tE=;
        b=gFymizwyXGNEznC1gD9QY/jQcf3nTuGnl4nsnfpVu1u4nYdmTPimF1E6mlPKkUbsTY
         ShtPnuBXiyNTQ1aW/WD4JGvBEQQ0UCCbRYnfZ4p5TTSyYw4uAsxmJSiXUQkDR4pSnhBk
         hIqBXaGeWrI4YLsXg/agejVmAuaaaTZKeZX4aExYxISOhGw2NdiuGXSFaGnQyVSUByKQ
         Kx1MdsaWcCxrUTF17Xoqa8SlavV1GdppjUEYlvHYP4ZA47cXVhJPUlZ+/zOSyWgfiGYE
         wZ7vniBL0bM4fSRewDVZfJISuxzPD+6YNyb8p6XejVwPOazlvDZmjRg4FsyYh4W+EBw9
         PbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121466; x=1782726266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kV745/KnC4AVvohHQZ6KvT7W5fptsCbNbjtoVOi09tE=;
        b=YyfuHv63jxoDUmCyceT/v34HGIuptTLq7s7FlT7oQTVQR34FtjpADdXgwlbtrM1tch
         wOL6kTWfioSsHRNKvB3zyGqFCLTJY7yg+Z0MfJ3wsIp+Ci2WpUCeM/yBLCZoDuXMQLzV
         he93CsYdyPxDnV+rrk9f8DVCDyLcFffNfjIG9iRzC3T6ZWEwCSlQl9I5JRUo7sMn44kC
         Vs26oVCBfdsyNlQozKBnFhA8JnM4H8MvK01TamEKq5z4Yl/N5gNIJ9XKoh5DTwFUwccj
         XdhXug8vI4MErsDsZ1ga0nN8TLYubShTiC4ry/qokqmqcmXH37gMKk1+TbMEXhrm7PNX
         imVw==
X-Forwarded-Encrypted: i=1; AHgh+RoJAZ8lv98/GJWlctTsdvJpysVaOWcz6hLPsefxNGQKMwPKdouCX6KB6d8k4+zCHSzZrdoM7LHjw5lDV4I0tA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3chk3iGv29m55kuWXzJJdHvCcdntsz4Bga6VhZkzZjRVp7cDB
	bpsL6sa3rlpz671cFvGxiKi3uqjTbqNZTe1GTMAj8Oq2wHaUtCXvsHfu1cf6LWFoxZQegDr7+He
	eADtKrr0xIspmUwRS1OPFOW3BqYL490g=
X-Gm-Gg: AfdE7clw1qyZ2pJ3EZu244arqSjLB4DN3ovKl6IkW8kEF/mQE0EIjzMnJiwxUa5rzTe
	i3Hm4WKfWFMCeeYqHzQwQtJrklIgd5oHH5bySJc+0z77Q5IL+Z580zwBw3+YFFhA6njuko7Cpm1
	vQtyGWV73/wjZSvSLWY2CoouVjVbG9cWf0RvaKPZx71wjyVcPSkDI/4LCLG4Q0jDyCmhfyotgyK
	L++K3+0XaTf8QNUwPbr7sI0xds0rEebhF568b9BgKtEiuRVJVXfTfmrhCfOEVUh7mFKXmi19oDk
	V5GdO7kNBKvjS12xVlft1/fMQvwnFFUyrIApwXPeGO+1xmNUuyc1oc+u2Go4/jtzM6ocZBPOFrx
	j6PAP5AgwaOJk
X-Received: by 2002:a05:7301:4885:b0:30c:48e4:972e with SMTP id
 5a478bee46e88-30c48e4af84mr353656eec.7.1782121466236; Mon, 22 Jun 2026
 02:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819003824.23019-1-contact@antoniohickey.com> <20250819003824.23019-3-contact@antoniohickey.com>
In-Reply-To: <20250819003824.23019-3-contact@antoniohickey.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Jun 2026 11:44:13 +0200
X-Gm-Features: AVVi8Cfd5-fIAs8Dd7iLy6sx7lMbiGE0CBekuGc1Vc4KbXojRNSURHlCR3q6r1w
Message-ID: <CANiq72m3RGNxWJcTM9Y=ayACFTf=Y=MM9RTtNpSq70bmdysWBA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] rust: uaccess: refactor to use `overflow_assert!`
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Cote <danielstonecote@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 2:39=E2=80=AFAM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> Using the `overflow_assert!` macro here adds documentation to
> the intent of the assertion, and avoids local `#ifdefs`s by
> encapsulating the conditional behavior to the macro itself.
>
> Co-developed-by: Daniel Cote <danielstonecote@gmail.com>
> Signed-off-by: Daniel Cote <danielstonecote@gmail.com>
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1159
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>

You didn't pick the review tags you were given in v4 -- was there a
reason for that? (e.g. one usual reason is that the patch changed a
lot, but I don't think that is the case here?)

Cheers,
Miguel
