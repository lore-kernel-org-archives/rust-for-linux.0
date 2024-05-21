Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFB91E87C
	for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716303176; cv=none; b=JtEWlEATI1ow61sY03FTChRxptlurQ/cpI4mEc2N1r3eCldJma10eudC2N15KCgYvnrUCyCyS1JPYA04sw8p+BVKj+PeM2UjM1gE8EovqpZCm5LpAckurE+OzwuS81Bt6vX7Y7nuYM2w62l6fPHB0Id8LnP48Sk3t4Y4PS4ngk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716303176; c=relaxed/simple;
	bh=cvBTOOpGuFTwSUUDgAgTQvDnQx/z7QcwtMFWKNPEBDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9f/Km6vOMm6tO6xz46TJoyBAw9p6WrYX9Yxq1FMHn0Y4x4j5098IYBHmU/WsB9FtWofdOXzdtQ0gP5peh2Izytp0Vuns/h+3MqC6g+0D7d+piWazjwi9fZVJbdMeT5jhbQ9BCRwFpuxRYd0I0FNNjWP904YaF03zGWuYru3eTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObNc/rDh; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObNc/rDh"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2b2b42b5126so409401a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716303174; x=1716907974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvBTOOpGuFTwSUUDgAgTQvDnQx/z7QcwtMFWKNPEBDE=;
        b=ObNc/rDhEhLU74MyjnMExoxJRrrGtzWWWbx6/XhTwMe+yRZJRm3zJl51hF3Pz+nMak
         FgCT3ViMISe+xA5jqQUKsQySda56gACyIPEnjFbz76LZ7d3tnANzmU/6CEO9RowwO1tS
         p+utTzvgSh5a+mHnJ1YVEVkzZxd4aJ2N9hzV+4Ou6dPlw1LGfYVz8NAhqu6xqk+wIvnc
         f2xzyYom1dyC7Y8kXLmCqLdELLRiZPoN/Q7WzccLoQBNePSMR/ky9USVtryDzoYk2MCs
         PgnIQRPBlDX7+Avbj6AbQbRbcXggJxHUQBC6zezzL+AoBLAM5QIogksB+1ECOeSXvtWF
         rUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716303174; x=1716907974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvBTOOpGuFTwSUUDgAgTQvDnQx/z7QcwtMFWKNPEBDE=;
        b=RKWfw7LI/3QTbN1u/gPVBC+lnlVMzNTDjmHbGbdmaWgokqllFH8niEha3Hfyog+FF5
         v9nmGEoOaZVggTLktSQKzxZ24m3hjaIBo15OQRUpGNRQjo2P3Dl7jFdI1hicFl0UKo1S
         31bMEVccaucWN1/do1wjKLn9cJOdB5xXPBTKU2O9QkbkXsigzS4jh+8wP5XCVV/3crYa
         nDIptiB2UI0osnVQ5EED62xhbrIblUYr6KcYO/iCV++oW6499Rpj2k82woWOj1qHvq/j
         BykEhYKfYlc/OpDxExi9rnEL0H2tNUexsxDNAAYG+WtqwUdag2mYRlcl6ijZqM7e91Xz
         dRdA==
X-Gm-Message-State: AOJu0YzI0UJpZqCR9vuetOOU/uRiLxcr7KBI+l/xOrCeVJHsgk6Ys/Uw
	ozHcNYaCMdL4rBNOHbT5AmOvQzqF/Kr5gycOXXm81qxs5L9uLagMJTtyR+x4qBaaQrE8SW34HbB
	ERPDzayTnLS7nVD5qKXORHEM6STCO7Pah
X-Google-Smtp-Source: AGHT+IGbebOpc/Bx4tjzpU/mf/ArjZQxuPU5AQ6EuIcdoWe3pgjRnQHP/NatVj2thO5SyRu+qoyxoo74dJHkSXZ1XTM=
X-Received: by 2002:a17:90a:9601:b0:2ac:9baf:25b5 with SMTP id
 98e67ed59e1d1-2b6cc76f70emr27725435a91.25.1716303174579; Tue, 21 May 2024
 07:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D1F44P3VLTBN.30LUQ60X5J3DN@kernel.org>
In-Reply-To: <D1F44P3VLTBN.30LUQ60X5J3DN@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 May 2024 16:52:42 +0200
Message-ID: <CANiq72=Kv217NDGf5sXgx+EYez=cs+hO50+YNnZf9oL2zxni9Q@mail.gmail.com>
Subject: Re: ASN.1
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: rust-for-linux@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

On Tue, May 21, 2024 at 8:36=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> So question is how to approach this? How the holding data structure for
> holding the deserialized data should represented so that is is also
> directly accessible from C?

Daniel (Cc'd) is working on in-kernel Rust codecs and is experimenting
with `cbindgen` support to easily provide an API for C code (of
course, you can do it manually too), so you may want to talk :) He
recently wrote this article on it: https://lwn.net/Articles/970565/

The main issue with a parallel implementation is whether the relevant
maintainers will be OK with keeping both versions alive in the kernel.
As usual, some ideas that may help offsetting the maintenance cost may
be showcasing a security benefit, or a performance improvement, or a
complexity reduction, or an avoidance of unsafe code, etc.

Cheers,
Miguel
