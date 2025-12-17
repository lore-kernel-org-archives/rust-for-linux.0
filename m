Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF06C18C332
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 02:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765939733; cv=none; b=ri37LPQr+IZxbm0ionIqvMMqBnJ4AXyJqclCpZHqsGgnQSbLUkqLKY7q+CyBB5j/q/5Mp6jzbLLB/ocEOvUSAifsbL+/QPpENiV+OCvsqr20IliDptNN/wUKCfnRUTv0F/tz2sNwwuL0j67CwotOx+chl/ZQhOgN+WWFhwp4w3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765939733; c=relaxed/simple;
	bh=obxRK1Y+7INS6FPNbsDkzAtG/dLy/RRFFHp3+NZlpnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqU3QxzJqon3WHeIh6YRv8l1aVlnpfU1pLqGTvnDAAtyst3/gY+6BFufEfw+Z/nCCpH6fvhF+ePbr8vRSIzH3quOuTLhXHc0rI8vLNiPmyDEWkrTtfyo0dxnoMOk2aVv0fKjUAuTePNW/xWZdofZ5ukSHzCcdZwGZ2lMQNaLc6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9bSVAN6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9bSVAN6"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-431048c4068so66999f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 18:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765939730; x=1766544530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obxRK1Y+7INS6FPNbsDkzAtG/dLy/RRFFHp3+NZlpnE=;
        b=U9bSVAN6LJYymXnkvOkKdaN42xOCTKcN/WFGnz8utSfMyI8IDSW8T0BWVtQ2R2oBfU
         NEc1Fa62cVi8qOaltsZcLLxNXWdHsSkKcpPryH6Bsd1IY4yuGtjVU5bkjGMGRa4Rx5Zl
         OZMYFiW8fZUBWUS9nhhPqVRCpDFgggSQ3vPCCofBIIlqPgd4OjwWgDLd2Vp2/V6sL90E
         AH2HJk6Fu1FeL3PimmmYpJeGbQzQcru9IgRp4CtIooy09mlJm0rF+frmMF5OS+MD7Ms4
         8k/sqZAFr6UdqKl+BIB/FJoZirwatNuuSAZXhL0ptvGspSLzW01qGgTzwJc+xMQFfoAo
         nXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765939730; x=1766544530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=obxRK1Y+7INS6FPNbsDkzAtG/dLy/RRFFHp3+NZlpnE=;
        b=ZTw3i7aYO8io8rF14jsuIRy6ELinOBgA/RyyppjPAZtc3xoepDYGMSSn8Qz1MUGRTj
         T3z+zWrCXjoDy+2n8y3UNF77slaQ67fDxBFyB46UjzkuQFA3yN3UZLLOayZ9kcGG+cFk
         rnszB2JEMiu131MvTCCsVp30qT9UmQGTxYsSvFmdWkvKKg0zq9HOeNoKkb/FUpffpNhP
         MkJwTQagAcZhcCG6xhi+DUrcCK6hXIP1Tp7BifDd6d3qkXlVPXzxGfgsyxpsX3v9AWLt
         Fz1PqSaephcOc+BvBx3TbqVNdaC+BLuFaQeGE30p6zpQnIGtgLFe1tah7YsxTkwduCTU
         TlCg==
X-Gm-Message-State: AOJu0YzCLYAzN5vGwWTCWS9x0blRaMWt0Ee2/2HHpQvZhOGBkLGm3Ryg
	qB+Kphzn7k+CPV9C8gBkccbcVC5yrCtBkoPzhD6V7cA53zMzEs7bi+QLsJVTsE47K7pDom/FxZh
	Q6su2PpeQLaa3nskM0tPO+stpAXkEAEs=
X-Gm-Gg: AY/fxX6g3oYfpkXBYyz63ngqWNVnYlcE0UWTa/zZ15QtndAjhiJ4JbdArMyJFkb5mwE
	QE2HQVrmxqsgRJ5F26CiY41wINdn+/tcH9zVgdnb+/Dq/fXzXpJMQmm4izmCk2YSgb7MbmCzNKf
	74KxfonMc/bmCxkzDhAmk6QHFYFIt4I5Qf8P+1OnKUk1g9oFN8iigw5FWVk3uX5d0nrXK1z3dhM
	TVbOJZOgd45Mezgv1E4dzqx+v0u5SWnKkRqloZlBRN4dMyHHbgU5KutQNa1JxILixWNwCUq+v71
	vpyQ+JWAuBnhwVBFagJ71PeOy64G
X-Google-Smtp-Source: AGHT+IGFEM20aK50iOTLl2MJq3XjJKOmKE+tzKPwnlj0ja1ORC3N17E+PB+g9+oAiKMphgX0KzjNlU4AmpWV9JkCRhc=
X-Received: by 2002:a5d:5704:0:b0:42f:f627:3a88 with SMTP id
 ffacd0b85a97d-42ff6273cd7mr12243819f8f.4.1765939730011; Tue, 16 Dec 2025
 18:48:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO3QcbiQqPpnCQFPcJYFf1O+-vJR9rUTHKdYwJJ+BMhviXKgFQ@mail.gmail.com>
In-Reply-To: <CAO3QcbiQqPpnCQFPcJYFf1O+-vJR9rUTHKdYwJJ+BMhviXKgFQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 16 Dec 2025 18:48:38 -0800
X-Gm-Features: AQt7F2r5pXqb9k8FvIaYQqAHWtU0ig_1gnEiPyWymvQ5qwWp8A4TptR4RlDHZKE
Message-ID: <CAADnVQL=NAHK5oXfy5-3xG+s_ZUTdzVcJy+KUYDJKx9yNmLpXQ@mail.gmail.com>
Subject: Re: [RFC] Rust implementation of BPF verifier
To: cb m <mcb2720838051@gmail.com>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 9:37=E2=80=AFAM cb m <mcb2720838051@gmail.com> wrot=
e:
>
> If it would not be too much trouble, I would be very grateful if
> you could share any specific concerns or reasons behind your
> decision.

Just because rust is no longer experimental it doesn't mean
that it's a good idea to rewrite pieces of the kernel in rust.
Whether it's a small piece or big. The verifier or anything else.
binder was written, because its C implementation was effectively
unmaintained, but the component itself was mandatory.
Meaning rewriting some obsolete and unmaintained component
in rust is not a good idea.
Rewriting a well maintained component in rust is equivally bad idea.
Rewrite fits only for unmaintained, but necessary.
Or plain new code where it makes sense.
