Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F7A1A00F0
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Jun 2025 22:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748988927; cv=none; b=GRbpXfJbsPCinLkTxYst5jGx8rBiywF1faPiMa/V6sza4lqBx3mutrmkLxRV/QkCxhxsttCgehd8QCBPO2M+uGek9kmRkW+7FzNeoBjRh0R+XxhEZ5w83v1DSyt3ypqc80Mirlnzv8j+tk4ufUjuzhw2kdb7mhbzzW9L1Gp7jpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748988927; c=relaxed/simple;
	bh=eE00HajaQkAY2cyU/BKG2JnRJzN84Ad2iyF3rFM6IXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3i/Y4Fcr/654wY53wZoBwFc1Cq3+dYeVuOfXN8qsuPoECLP2gD+caxDeFkBUt9Az0P1Ljpz918FjWh+1eHmCjnaNYFpcDW3R7Kx/a7CfTDTPytzL2qALGqtlADDBCq9BMt9GGF5R17VElxpi6dKpF3kLuKhMkKu8nmVcXQexIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PollvnIr; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PollvnIr"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-311f6be42f1so1124732a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Jun 2025 15:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748988925; x=1749593725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eE00HajaQkAY2cyU/BKG2JnRJzN84Ad2iyF3rFM6IXs=;
        b=PollvnIr6SYNg16fWGkrgAj44eNw58zE2pU/pLFqSQAMA3UKFR6KeGZrgqhqtn1/op
         MpOt2xHVdavnaq0M45FFa/Vc/O5PCSkTq2xkhaVlKFnhhU5DKLle+P2b723D/0NjCJMl
         erx7S5h2P3Qn6cZEaIZmuMex+UzljlKhceTuyyUC8MjK09Rx4Jg/byWeyWWO033scMdr
         3ms6i2NaoJ9GTCBORJSIaVspayEgKZn7HeLZ9tDQEo7okm58FJYiTLzr9jcEEnc9U4Ry
         D3NiMtQ59fqk2nQcGwnVwkmIrFOFriiyYVLHHRvFW3utp37VP3nFPbrIo0IDVEnjnjE+
         yxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748988925; x=1749593725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eE00HajaQkAY2cyU/BKG2JnRJzN84Ad2iyF3rFM6IXs=;
        b=Bxe/Vi5KbfO2krniTHt7XmYl0r965vHHpd1Ns2P1U30I2PygeEZIrVx2669v8lVVsz
         QoE3o1eyyuPDOmU9Aze4pAJuO2kI/GIKKZYScBUcG4qFnVJB2PeQ5C7fxE4ecyNVK2YE
         Bivb+pHDc5DOeKEjleYbv8xftQGgWcAvbOD14SYoXSNUCLndX9QVWtZmJ7uWUDvWL8Ng
         LBDNesxApcNqNZJYwoPpGTWWTz2EwVr5Gs5Jwod45+bTOn4ioDvpIE6DbDjDWVw5IT4P
         TroiNfdiGjRjX60Es1Qs+l6wjSN8ReDH8nZXJnp+8Vy88bVfW39sLdZrg67i1l8f0YxO
         7PZg==
X-Forwarded-Encrypted: i=1; AJvYcCW4rf88spitRehJfYi8X9jh0tArt0xFstqMsjwXmbA9uuJt39INAGrQNMmCg6DDzh4+Eu9z9CPsYWmaBzQwxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YziF2+jXkedyXDs2V2T9StGrujyRy6RbKBazPB/rdtnxwGhHKlm
	BUXCT+iBnXSebSMjS/UIUxDZ9dJVAREPpOv5OFeGvUCt6hFMyeu7CnGEmwKecGKRmjLqXRGRFkq
	e8wp7qvdg5HCz3YMkxCtciU+WILhUzZ9Miluu
X-Gm-Gg: ASbGncvoUDmIJM+PaPelKIm6tXJ1g6a3WkxnvGxm+3F1EagRJKYUzrx0UANx19no3Rk
	JokMaPRZDV6xjyvoHXx+3fE5AEEBPv1YaOraQPZndBiTCHnLgW7Ke3Zg5sK2EBhDtGzIzeZY5Ir
	RvcWSwXwdpTsmpa6z7NmDr3zrRG7oTdfHIvy3nk+yKELo=
X-Google-Smtp-Source: AGHT+IGZSW42fVuyEqPvij+P8pJf9eer8APlxbSOZ6q5mVoRpox19Dh9gWa2oXyoDYdcqHT+tyrZkH+3v4LWffzgI2A=
X-Received: by 2002:a17:90b:48c6:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-3130cabf1f7mr365140a91.0.1748988924923; Tue, 03 Jun 2025
 15:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529184547.1447995-1-ttabi@nvidia.com> <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
 <DAD8GTNP7E50.3CEF051DAP051@kernel.org> <5cbe30e8f1219dd67fd4de9a1156adc054db4779.camel@nvidia.com>
In-Reply-To: <5cbe30e8f1219dd67fd4de9a1156adc054db4779.camel@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Jun 2025 00:15:12 +0200
X-Gm-Features: AX0GCFumQniz5ikCwrjz0bQY-e7MZkPOQMQmBeCG7AXUHjNqLBLeUSj8f3jSheY
Message-ID: <CANiq72kEA-hzqkrXxSUk4bp63NFG=TxmQU+9+yiJsoyuQr86Qg@mail.gmail.com>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
To: Timur Tabi <ttabi@nvidia.com>
Cc: "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"dakr@kernel.org" <dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 12:05=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> But won't that cause the functions to always be compiled and exist in the=
 kernel, even if sfile!()
> is never used?

Not necessarily, why?

Cheers,
Miguel
