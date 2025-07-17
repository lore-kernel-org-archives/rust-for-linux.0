Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD966EEC3
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Jul 2025 00:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752710585; cv=none; b=JmT/iBdCz7XZQYq3q+qiHmYu19zT0yUsmXXcUY0o+pRTJndsrtIYWhWyHEvq4n0/FNvmaxvKLargXnFipdVtw3D14THD4miLNwHFAqvy6+xLcicIuMex+kxAVt7DwmxP/CGp59O1Ikz6ssvH4dcK0heEZClokOLD32vWmEF9XbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752710585; c=relaxed/simple;
	bh=Uc9vnVwX+rfxjp0KCguddX7LYycaHsWTTqkXZgrxf2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sL85AGLGrsABvijFSEWu7SihMt/kRXap5lmCNxZNO1CwA876TesmlpX9yJzZYAOXkgokOzfxMluWvZPjC2pYnz3bSdS0ZddXMLeipVKyH+g6LHTvJoCoCW4PJRyz18jZjS0GxAKkQoX51nUM8FoHmDf8N7e7/wcT5zbU+7E1AEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGCbm2eG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGCbm2eG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23c71b21f72so615115ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 17:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752710583; x=1753315383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uc9vnVwX+rfxjp0KCguddX7LYycaHsWTTqkXZgrxf2Q=;
        b=WGCbm2eGdfat7zxk4i+8dGsoUBNSkFkqhlUnAu7lj+xk1HHyY9eczEiEjQJFWnjRAp
         ElsQ9eOgE19CxK3q6jbUxYAvTgmBC2y3GR0j+YY/pTTGvH40hcvR23wul7WEmTfTT/TQ
         h0VOSHQ+m2O5l3EsuJUuRG0hzHwVaHgHSuJHHh+WJF0Apf+KSP7eMruDzN0HU4+QSnCi
         EWL1JVX4yKSMCoeF7ggWHmVjj7jZ12yNbmqnFSoww4qmVXE2hvZyyKlD0VW5y30UlagW
         g/7WyYNza9dcQB1cYsIvqKV6tH1nP1yI8CbGYzCxDdHjLrBfOYzsYKde4LXorMMfFbEs
         QaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752710583; x=1753315383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uc9vnVwX+rfxjp0KCguddX7LYycaHsWTTqkXZgrxf2Q=;
        b=ijuUR8GTVhYt8EvOz4+GUhOoyLxjMXAkUtj5CU6/gZxXfG3zPZSkdCKSLjGtio4D84
         XsiIBeA70BnQIRua3q8xH8eWCGx5jLdd+6yAA8nDVQxZZTHhiT09vfz76N3Oq8SlGsKm
         uo0gWt5p76zBJ8eSegaXs2Gm2fHMt5nLh4rbyzcN3Ud6e4lXqRPyWOuoJg+kOlS7owA3
         QngMqaFMQ2EUEycl7MKOzQSSS2YqSxJx36WW9VF3DF2hFRl7ptHuxSJgng8acskaTN4P
         Lsgnn029iX7RI+dW1ZtTVgUV+wsIvv7GIr9bd6ncAp4ouLbWtVf+EzOZMetRMyt45MDL
         DeCw==
X-Forwarded-Encrypted: i=1; AJvYcCUwHEW+V3asvJ6bs/5Wq4oV0xB/gMxtItMAIFAw3FA4VeP1CQmZLTqZ8qPqB2jb24DmGJJYqpZ/tuHBgfHVug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ4TZGykAWToFdfhTsPf9CI+dGuUiyRjLTr8yaLl6Ex+6rLrBC
	damknOoD3Xb7/q/7CF6IMhC2gTh4vqYjtXD6ZyONLZV9e/3ocPmmkudBe4D2UT96Qx4fXlJlZF3
	8LS/HDWVSSpVU4+V752yURXYQKByRNJI=
X-Gm-Gg: ASbGnctMC6cXN9p2wN0X7+Ty97l5gKzIjJg6a12b3uhw+xveUuEdXYQetpaEduu0ya+
	5B05qfcnnYdpwwguy/tVwdB6myf1YHlC9NnO6F7vEjxrhcL2ggA4tN9qzTNu+aYBUaKEj17cp/c
	g98TQ9IG/Lqc3ahosF+NJST5JZtO3glYZs+xIoo0ookqPY/gLTBUJijShqY3IFrK5ibC/rOk6HH
	rq3v0n03ioITiw/
X-Google-Smtp-Source: AGHT+IFUFiDTCNYGpmT04q/uzLOXfBkIpd8mqcnZaqzMqjyBvgexQ1T479WS62WODdQ3tEyH7QaPX2r5YmEXLhS1FQM=
X-Received: by 2002:a17:902:dac1:b0:235:225d:308f with SMTP id
 d9443c01a7336-23e24efa257mr28394845ad.4.1752710583026; Wed, 16 Jul 2025
 17:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87qzysqw99.fsf@kernel.org>
In-Reply-To: <87qzysqw99.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 17 Jul 2025 02:02:50 +0200
X-Gm-Features: Ac12FXzjoPidqqbHtq0F0x9xU70y7Kvj8YgXgYO4ezK7AwrN8CW570heg7ZFo_A
Message-ID: <CANiq72mEi8V6bgBJtwf1acYoCcj7sbkoSab2mR_WBF--a02T5g@mail.gmail.com>
Subject: Re: [GIT PULL] Rust timekeeping for v6.17
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 9:47=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Please pull these changes for Rust timekeeping.

Merged into `rust-next` -- thank you!

(I applied the related fix on top.)

Cheers,
Miguel
