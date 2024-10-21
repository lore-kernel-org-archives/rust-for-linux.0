Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0831C69A
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Oct 2024 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729498765; cv=none; b=YFxlbaKZMdreFrcEyjZVTfMlQAzU1q3U83U35ba5b1gXaaCvp8Ed7A8FT/4r/aWCkiK8dq0t7rr63lqesj8JLxGQcp5Dh52hEwWL9+Evi68m5xk03B0Oy4zTlPyh4HFjI6FMcferFfT/+dPn8nwdnhBiuGoF/T8CA2PB+bVa82o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729498765; c=relaxed/simple;
	bh=mFJ+jTTfKkdDniPBSQUJJosMtIC2qKify5vSds/DQhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/be0syKnzCINtFEM0THWjdhOIT3Et/6jCUTSpdmrU3pZ22nzpF0FN5oMYi+SPGHNY03l0tT7R5JYHmu+dlRRj61EZ77s9eEdJWCE2DvocTRp2zf92jFeDYt84nHgbp1CvZboPqQlHPKrxkvYxdoFG5U0zGsnn9fljsbKZMjiEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EuHFThS6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EuHFThS6"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d4c482844so2860678f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Oct 2024 01:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729498762; x=1730103562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFJ+jTTfKkdDniPBSQUJJosMtIC2qKify5vSds/DQhI=;
        b=EuHFThS6LV2lR0gR3MT2fu3NHT5+VFFDyX32cxq6xowREimAqoWnH9CW8BKFaLXbms
         yNI6Pgi7siCxxLoMTIh9zK6QlV0XAdCRXi1aUGly1W7j38wS+j76dkNTf3zQjSi14kZu
         Sxo4rWSS21vymdxI90qcqGMQC+kxMX2DrcIsRhzugcCYWx0JNK7VCGIKVw08/ObqiWxC
         ljCOAF7+1112YhQx+6M4kBswyL7Sjci/ZafwwYBauuot/0SNbW04r60u57rXMoEN+nnX
         JZ/fnAzCMZFCqpwbUNq6Pa9UNe34frRYDNUVB/hnkinZxnY+urgiDxQ6FIpo8JhqhmYJ
         DY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729498762; x=1730103562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFJ+jTTfKkdDniPBSQUJJosMtIC2qKify5vSds/DQhI=;
        b=J6yDgafDXi4JEctmy1ZwnGb8m9KlTzd/WEAsHYqUhjMnioSNoC8lwASYPtuvVU9RG2
         oaboYY2TQA4SjitCnmis8aiB9LPecksx3NGLFUZyv9qPgtAmiJzBL2KM5cw/NKDyTa+Z
         WLfN+uJWXZpiAaf+ahysBtva6E0zSNi13plryjZRyBZgfVwvfUMZrbwUwbgOrYXlJ/8w
         B2lpPaZkOcbvq7Lc4eGqJ3LL0gxQatBW7+mVQ/xXfkPXyCXRLobb2qqcjyIKjjpfpCk5
         ShC1hkzpHcY2F9fuCNPxsXGm+/MdwXPzohGW06y+J8G5q/nt8TMouqu2pirNfAaUpVoX
         ZPwQ==
X-Gm-Message-State: AOJu0YyYIk5o3tSwvLq05VvaAOZg/i1O7NSG+nItFdU1Z9rs2budbHnP
	oUP+zhnrvWOHRJSitGBjfP0ZvWFIPD3E6guWydo+2MRkPS15lLkwhsYdJxpfN4+VSgnBXioml8t
	WmEovTPUjUhXwrSpieShs3vSLLFPTnsfdxw0yLNkKhZ6AbLJbUw==
X-Google-Smtp-Source: AGHT+IHw5dCU+J6PRBi76YI5Aq5xi+/qBnpUoNOfRwi9yZEGM8ix5Swm6r7dZ4VubN9BUVYHza10z63tdgwCzgAd8os=
X-Received: by 2002:a05:6000:186b:b0:37d:45f0:dd08 with SMTP id
 ffacd0b85a97d-37eab72763cmr8583173f8f.11.1729498761709; Mon, 21 Oct 2024
 01:19:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019072208.1016707-1-pbonzini@redhat.com>
In-Reply-To: <20241019072208.1016707-1-pbonzini@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 21 Oct 2024 10:19:09 +0200
Message-ID: <CAH5fLghGiW=7WvZSbjE7vXXrOBhUSrrGaCDdnHiTkp79Trr=TA@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: fix documentation of the paste! macro
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 19, 2024 at 9:22=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> One of the example in this section uses a curious mix of the constant
> and function declaration syntaxes; fix it.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

The `pub_no_prefix` examples usually defines constants rather than
functions. I guess it is a function here to showcase the :lower
modifier, which doesn't make sense for constants? I guess that makes
sense.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
