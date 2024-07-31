Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153581A76CE
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722414822; cv=none; b=PKWZ8rXJm/7q76LvLxzdeT3/unCxRTAnQ5PBxUHb0/lrdUbNPu7Bc0wDoSJEL0M85UtWI6KoEX35ikXNyaTWbjDQQkGH2+Ag/Fx3eypnwBuMWGtqnTML0SNKD9Mm7iiVHh08+z1WUEXCE+XRfyDM92sldk6d4mKW99E+3BydMi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722414822; c=relaxed/simple;
	bh=BnZlSJDT13BF/AQaE8D41cQwd2ylQWg/2e7Wx+5OkfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hf0agiz6BWoJsBDeYorZuVQ+5j+IGsEK5ZVvT1SkJ6uaXo2yI8uH7+CQo/1clTFgZnoNmkFXTB6qinzJD+88ZV31Y5AZ4gr/zHKO/Xb1D7wy2HZr96a6LEOrlrTY+zKRcz1CSLBf9OlEz3t4ri77QghGwmZ2N/kk+wCsOVB0x/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SkskTveO; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SkskTveO"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3685a5e7d3cso3079023f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 01:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722414819; x=1723019619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnZlSJDT13BF/AQaE8D41cQwd2ylQWg/2e7Wx+5OkfY=;
        b=SkskTveOUHZ6NHngkBr2S4zZs2T8YRSdd1GP4ir7SIL1sNy0O2+O8ncaa5lo2Ygz4d
         r6bccViMYtWWwZ+a6LcKp7otom/7JSjAg9xY4kFWZWhukZC1puTLIusJXHaco/oHWQLu
         6rzd+SlxdKZoTkBrv6wTyg715o3JCmDlohJfT8EAPLjvWvLuRECCCGwT5GprQPOoHLLv
         KocM/38zgXKtTJ4uvHP4NzlHqmw/dCt8jsuItlmsCX3Qh9tadYTKX4TKjZKH9wP3Afrg
         LJFXTrg87Qj6Xoe0cb+Ij4ak+4iyV37hYDWhpcReplz1UDTqEW3Z3onH0/RlpSt3TcaD
         DjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722414819; x=1723019619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnZlSJDT13BF/AQaE8D41cQwd2ylQWg/2e7Wx+5OkfY=;
        b=JWtxo0KtqzRllKkpk/TEaIZ+JBP5un3H3wX5IvLF2DouIGVul8tWo3sHnaAcWDZ2TD
         N6RVqYbAfOcwkyVhqSaUqEjytyy/QG5UuKHE/KFIQ8QVmY38Zgdr4zYHbclKKhCMwY0r
         u89NuXt9vO3s9AKnuUFIiJnSu4VHAnP8jFe27ACud4jvR8KG7xX0mcOJXiPojQvXunng
         SGriMyaukbei+d7SNmTeoqik0uBEQKu5g2vQliKzuyHpNp/zWBvUkPCFRMCliARVMnso
         hJ/8Pla30u5Jdo8tSlKIIygKuNYBtyiVHscxqK+s2uzLLzA5iTobpeDiWnUoCSnWcNb0
         UOqA==
X-Forwarded-Encrypted: i=1; AJvYcCWNqjwz3IftIAhUF6kVSLogn+zjQ7LoniSN598Zd3+9LbMahFH/m0Lx46RLqt6Wd0lIGbKhtMIDyLi5X8D3Mu7E1tw0f8F3PE+CDAm9lSI=
X-Gm-Message-State: AOJu0Yx0jaWVycYT/lhXqtiJqVpPe/RPYBaQw+l8I3okxgTmhgAjgRdz
	MvRDlaeaWI7qHOng34qsBJGfB/UI43ps/hKStKkkCtajS80jvhJArp5t1XfC8k8FRbACyEe2ZXk
	yOQrXUyqgeCUC7KumMinv3kj1yMCeuq5ydUWu
X-Google-Smtp-Source: AGHT+IEOPSFZehJ4N+U9mXeYBFSf/90MywPIzf/okvTbG8RbnfAdjDHuC2bUBAJGaeMoFbbkP9pPL4jBpOu5oUPMs/c=
X-Received: by 2002:a05:6000:18ae:b0:367:8a2f:a6dc with SMTP id
 ffacd0b85a97d-36b5d353adbmr10926566f8f.44.1722414819015; Wed, 31 Jul 2024
 01:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731042136.201327-1-fujita.tomonori@gmail.com> <20240731042136.201327-2-fujita.tomonori@gmail.com>
In-Reply-To: <20240731042136.201327-2-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 31 Jul 2024 10:33:23 +0200
Message-ID: <CAH5fLgjvGQiwTPvCiC9MsgKKHh+Xeyp=VvGyp_MykbLnor4tMA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/6] rust: sizes: add commonly used constants
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 6:22=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add rust equivalent to include/linux/sizes.h, makes code more
> readable. This adds only SZ_*K, which mostly used.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
