Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AEA2D47F4
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 21:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771018665; cv=none; b=K+WwdO74cfPXkbmNbGSZs8CE6Ozheu39EG3L7FXUZ2mxJfg56Phq7EBgZ2wivmum8TaGvOKLOJCN6khtwj8TSxpZ4IBZR+c8HpARyYzuW9XC/5IxPYT2x5HJEpX+9Hy4JzKmp2eR2CuYxRF2mjqxQRwg61vAwrCRu934BWpjGag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771018665; c=relaxed/simple;
	bh=SY58b6+HRdTcifkgHRCynchJMBD+E6jLhYjyter0gdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1htnDSfYPw7yoaJtQR9mxowWthRi2kYfMHNkO1fdXqAh59aJdv7Qs+lnz/RSm4u71e9xcijpmXJrGTvutfmQi1g7OIEg+nN45OQlQumqOcfFW/0IFqi+rBMIAnyMqjnhVOi6anhr00UmhySkzTKNV7rgeBLjY9MGO1R2+iYe5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uKIhLlGN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uKIhLlGN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48318d08ec2so1645e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 13:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771018660; x=1771623460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lEpt72S61dcbjCA7YaZRUVRE2wYR3DyNZT5FGpvGmxc=;
        b=uKIhLlGNFekRsdbrw69FTs88Sst3Q3TYmwsd1cwXHGEnNvTVqurk6baGQo72Fq/WJL
         e5FUeLeprNUZJX7BC4j3jgXHQ1/03/DICT6FloAfS3UgI8QZwEWDpVh1puAHwTZWpw4B
         exUijUvY+lYnvqt8eUaJr7DyphN2bWI3C0/ECeVbafaTkhz8Gvap6WDr+SYrHye51XJ5
         3r85UZ0dPwjuoVo7KfPpuX21aiiyqlBvyrVr89zjx4u7OgR6cUjVd5y+obiyHekg9UpH
         J1Z2FXjCuFK26o6bSBFUEl5b41kgdeuTrutH0JQKh+5HGEb1b+IlflAoyDGkbToBNJZK
         6RBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771018660; x=1771623460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lEpt72S61dcbjCA7YaZRUVRE2wYR3DyNZT5FGpvGmxc=;
        b=hYMsRogr51en6MObO00J/KMyWM27aSGnOejqlCvaZtxDfc5DFE+r+/yhx6GT6VH1SR
         wvADioxvRLyLW0fKf8lHKzQJhS1euxusNtu43QeQbVZFuLENWVnLjFDEtQ/ywHsytEf3
         F9jqcNAZLsnTalrEUmDOAZKylobajxtkdvdbxJuFzYheW0q31BCND4kReoQbsBt4bBQv
         VTMoYtDs4KEqVeZlMvtjG00LCRalzSCGc91ULJvrZS8w0ar2P0zDherbQNneE4xsKUjC
         f3HSIWMQoB5+O84wcIN0ccF/K3o1zBjCKg1CXP+92Zd324jJX+/DreW98en3UKO02mK4
         8X4g==
X-Forwarded-Encrypted: i=1; AJvYcCWEEIewwiUh2720Gsu7NQnsROuVNRAW8z3CnVSgNJu4F/4B13fdPa+vjLZolp7hZyejIyGQy8DbIbgvPmiWxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4auY3Qje+WnAFlZIc6V/nJLZx8OZGBDdPZYN9hA8B83bseY+Z
	skXlSEGmpbKx604GP0h8WHc689QuYxWB/tVauaaL/NWVBZY6kn6KjuAnMxYWFPN10w==
X-Gm-Gg: AZuq6aI4p8xNxQ1jvK+jMgAvJi+TbjGapaKRXCHIELOVp9ff2AceNzxVvQBzSLfO6dg
	2X1scB1q140R+yGeC4qsm3dAMmk3AQ4IIsHkqFg8hF6YMYCbkVQGSXEe9h2QRpHqrSLo7wTPAem
	6z7XEgCs3qtGfHd2WAOv6pPefR4o+FqziphNXkhfckHzs2lE7QXDof5yvej4BsGZEfRnF8Xj8M/
	Hx/asubCnGfjsETWl7iVywmpUN0zVI5LaUWcVAMXGS7LZyxOhlf2LlHXv4w4iKZFp+OHC+bnWzV
	EK0FKRFLlShAeYhuLEr151Lv0BknWfIgC7JFmkEcnLG+OJL1hWMXB5bZSftPN3SX2iAk+9N2n1V
	VBjzr7YSoFXgEemcCqacb1nrB7xIOoQH4b4xWtIIyC7J85r9xpXvtAwZ3o20tIbuYawqYaFgXEl
	e1DUCr0pec0bCVbrKSNIDY3Vu1SbdnXfpVOgsRsK4VZLl9ymZhapk=
X-Received: by 2002:a05:600c:3e0c:b0:47e:d9e7:1c12 with SMTP id 5b1f17b1804b1-4837a1aa909mr209755e9.6.1771018659628;
        Fri, 13 Feb 2026 13:37:39 -0800 (PST)
Received: from localhost ([2a00:79e0:288a:8:989e:b55e:7170:736e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4834d5ebd34sm305288435e9.7.2026.02.13.13.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 13:37:39 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Fri, 13 Feb 2026 22:37:30 +0100
Subject: [PATCH 1/2] binder: use current_euid() for transaction sender
 identity
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-binder-uid-v1-1-7b795ae05523@google.com>
References: <20260213-binder-uid-v1-0-7b795ae05523@google.com>
In-Reply-To: <20260213-binder-uid-v1-0-7b795ae05523@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 rust-for-linux@vger.kernel.org, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771018654; l=901;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=SY58b6+HRdTcifkgHRCynchJMBD+E6jLhYjyter0gdQ=;
 b=HrbwHznEvXkU+4YCZvpswUgLMo0y7cKmzs5GkwzOs845c76TJOqAwjUgsUpJC/Q77l2wuGYXw
 p5s4W+3CZ37CAeHz9HebXrFqh8mGTskODpvo8gOU7u7k0fB9/26kG9i
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Binder currently uses task_euid(proc->tsk) as the transaction sender EUID,
where proc->tsk is the main thread of the process that opened /dev/binder.
That's not clean; use the subjective EUID of the current task instead.

Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/android/binder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index adde1e40cccd..3dfce0fb9e13 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3113,7 +3113,7 @@ static void binder_transaction(struct binder_proc *proc,
 	t->start_time = t_start_time;
 	t->from_pid = proc->pid;
 	t->from_tid = thread->pid;
-	t->sender_euid = task_euid(proc->tsk);
+	t->sender_euid = current_euid();
 	t->code = tr->code;
 	t->flags = tr->flags;
 	t->priority = task_nice(current);

-- 
2.53.0.273.g2a3d683680-goog

