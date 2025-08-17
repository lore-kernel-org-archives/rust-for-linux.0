Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7569A218EA1
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Aug 2025 13:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755436213; cv=none; b=nbwpir5LGsWGinQ4kP0odXqYlKIol9H3YNIqUgt+fmV6Fht7caZd45aKy0nuosmOl9wEvzN3n4WvrfW2mC3nKklsLpdGpsMBeGUW5vjT9NlFKIEXVxGsDQlBlUr0Mw55NkYAENo3vKQ0e4dFg2gEd0SQPTx6y6iw0tQim47Dn7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755436213; c=relaxed/simple;
	bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=lkPdYJlYDQzivPwMtJlm0uXphGIy647KBfXSW/3umhuuSaDFaFgUgCdGvQzHNIwaIB6eH8Ubfo+iG8wpVaNeiq5amPD4cihI0GNFaLJ3Jsi4yV/KKSnfDB3NRDS+u7X+D5iNSXQ3ZZG2ITcCvBjtAbp82pVNQEzgT/ljTYR82l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDiJ7bZV; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDiJ7bZV"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-74381ed5567so1857930a34.1
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Aug 2025 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755436211; x=1756041011; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
        b=dDiJ7bZV1O3yU0bc2bBUma3xidscKFVUnNjCWIKjStYrS8NId8xinCKZw72iOCjhaM
         TK+rX6b36KmaF8kTVjwlcgOhgaxqlRWEjJPGVlBNnhJ8sueB4zG1hdcDMeGyS8qf9Z4b
         oNibor/0+2YGMTCfvGFqeoCW6zxUknEE9IY5Zx0XJHJAb3WsGGOPk9GL0MpUUbMeP4Ja
         N7DZwWUYAWx99E0yzSnWQtTICS6skDObc3KRcSZ7IoIArCcNrtxb2sZpoaNlHuJ7PWy8
         g4XjReOcSN0RGh1dkZdwOEdJfQ/FLgCn30SMQOlxASGYgp7f4ZBjKOhL47wBPoIhRy36
         dJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755436211; x=1756041011;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
        b=ij/0EKllZ+QTe2/aQKCBPzPHervEoFikyeD9dn0Sxz2L2daDi56ZohezeudFKDGVYj
         u4BjzkNv8EF7XGgbkFo7uEYheZn2OXr3FbZzzXwuPkHYniIdMYw2i2UaexlIZOCyIi7S
         gZwtAMFC9J5UJzzrCbNIcxZuRQTJH7jecjg5rdoHT7WyHbLUDJV2OpFIvqspuwy76rpZ
         yhxmtOyIdoI6UJ1ztV2y4wH6KcBc9aSfH+jR0+A/kNsU9ySmAptA6LqmsL3cz5J2CK0Y
         Am/dOW6So0eSs5i7hNexm+lkIGwvnSHtUA7/l/cI40Gn6f/7QLLz1zDqkJKn/pyaLIxu
         dHTA==
X-Gm-Message-State: AOJu0YyQeS06XEM3x1bMbtvbWNYn9CUEen2tUZPkcadDdrDAhwlM4ukV
	qYqp3ab/Ux9Wh2a7jYCj9/wgL/o4egglC1PzNHLfFR6gI7m/wVuQM+sgcOenxuk63t+pBizZs+R
	ZCkBNwRPeHjvPHP9HrZO3Mr2p5lCCG2aDpA7n8bYSYQ==
X-Gm-Gg: ASbGncuQSqp94S8fMCrr/tCdI1EjxXiolBSuntEgKP+p37RWScgUlaMmvT+sAPE//zs
	w1j98XZWKdDfkaXzG1F6O2tj7p9InX/rVYlsJVXOCvLkjyHiq1c99QP/nfVm+oOhD6WAB7YOo4r
	KczUKm4Y8mr5mC7i2Vzgfe76O9XR5NN8wFHMgxqDjHjmFMbLXbuOTCOlgZ3msmdwx3g+O6UE+FY
	JBNe81BW0HXcIG8Bsc=
X-Google-Smtp-Source: AGHT+IGVfoPyILflRsGUoTFc3XsmthPRUHQzbWv1295XshZE3Q7ari+fx7ugGGpcB650nmkhdh/QcXtN0nnRj8wWkRE=
X-Received: by 2002:a05:6808:4fc9:b0:434:1546:17ea with SMTP id
 5614622812f47-435ec4c98dcmr3989098b6e.28.1755436211109; Sun, 17 Aug 2025
 06:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ying fang <fangying2725@gmail.com>
Date: Sun, 17 Aug 2025 21:09:34 +0800
X-Gm-Features: Ac12FXy_42wnaE4Sck4lAqHDdmybCnAKCBJ7cZRSCLRL2sHZz7GqsxKO74yu3YI
Message-ID: <CAD-XJMAtFUUNQErABEWMsnVZmV1cXwt2DAQPvy2pHKZuY8VoyA@mail.gmail.com>
Subject: unsubscribe
To: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

unsubscribe
