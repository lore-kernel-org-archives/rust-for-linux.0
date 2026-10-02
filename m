Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827763BED55
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932621; cv=pass; b=apiMzGkeGJ0j9K5+GS/xSP+dr6ELcbdUYOqn7H5l7uXedXi+C+6fx3npd7nwAeW9+WIRHVCvqLqqPpstFKQ0KypOtci6AGYhmXE7m5lwa8JZ6kr4eVL8caDt0CrniWODBxj/Yh5jk/mvU/ObIX8wX1zivhO7lQh8n3MSjl7RnUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932621; c=relaxed/simple;
	bh=YiCPzni2Wl6GvelfU9cy/yhPEZ/U3/3S99KBiab8N+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzEjNIqiEJJlYc3eBbLUJyvrgylUpyFBEp4l++JEC/ABs3V0z7zgtb4IskK0YEWOUpqXcwcuGF0kt1YrNWLJc4ar9trkRxCqAz3GfnQ1Irx8vBQv0jtrTZBHld6ssYjcK+9WhRngrvTgUW/hUDLPUPmLcptxfv8N6u5jlPjk/6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eH9bqL9e; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eH9bqL9e"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e79c06622so838992eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 02:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790932619; cv=none;
        d=google.com; s=arc-20260327;
        b=EDAP8hZ5+KxhGgFFNu/pyqpG4LGYv9R39sjycx0g7QX1rC78jQ8WKFhfxEjk68l7bf
         wcT2ACr0ygLfYJNJrhudeGM6TcuhaXcOc8JhVZMTg+uqfzRyGffm4/W4zJItSjgsvptm
         FjLh4d/bynvh0T6qLyj1DRz/x2WQj+8OmDeo4qyp1CubNvUHd8mSEYXkY+gSD0SNpEGt
         y/+L9ZN0AVW61IfKWggaNsxS2vX9vR6c1dAmHeqSA/VP1cE2v+m/QWVAT1lSRxZ/T9fj
         8dqgzuciA5r/HWgb2du9Rm8ELkPVU/3pJ9yZKiF5ILzVkdQ4L7epuae2q3RUENFN0GbI
         2n2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YiCPzni2Wl6GvelfU9cy/yhPEZ/U3/3S99KBiab8N+Y=;
        fh=b5q9B3EdwxpWNCwpTjuXuhwf604bytpvOepz7bneQVY=;
        b=SgcQv46BqmUuS//UkJsTVBi7XzfbE7Vz6Oq9dp+BNUplTOCfFLOd/n7zocOZTgVFbZ
         BV+jwl+HRV/gnk6wgr/mmR8gNJbj7F2G3ZsCahU5sF9lgMxtlM+qBudmPARoBPBMBhka
         v11imjeXzmw0qMXpeYQpHzIncqieSwUzdYTMIzVLTnJO2EzMrTMGACMb6lexQjbZgcS9
         0hgaRR97BBNUB47NbW2PGJkmRKAo8DX/cXOPxjid12zJaSR+T/Uh/exEwFl9PPcU0FmU
         WuukTjPyBt5RAD34mK4FGFgJq7pCLTUUY92lFr/vaWbbFgyZFczdxh6cD2oKa39smRDy
         092A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932619; x=1791537419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YiCPzni2Wl6GvelfU9cy/yhPEZ/U3/3S99KBiab8N+Y=;
        b=eH9bqL9e4sxWU66/AM8dyybpUwX7jkVs6hwrT5nNxc56+DqMJEhHRz/0G9NdVCKDT5
         OyRcPKB3Gkpr72QuRJSvJN0v56v3AHT2aB+eu2GMRo1H9wJVrMgo62V5+x/H1xnoY5N0
         oQr5srVSgbcNiBZ9maIubuzRb5peEy7VMVqdqeitHU5egwpR3FBjlXjDsd+AXWdWtOgr
         K6AJIHWqgDSkPVdu5RgS6hMVi3D8QnKF26PMQT9fT/a4aRlO13fOps/92B00oD4NOJf4
         Pah/UuflxyuUwHLibTIPx/JwLbcBrM+GWPibM6vt+YvEmXdLBuBGqoZXFE5FJu7RIrIL
         3agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932619; x=1791537419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YiCPzni2Wl6GvelfU9cy/yhPEZ/U3/3S99KBiab8N+Y=;
        b=jFI8tG9Mgdr3CWiW8pORPY6kKQ5VBVZ28MziPWbh8YmWsK2J1DVnbg6T81U5F2rLia
         2l6Bx4OSLRUur+mG6ReRDGICz4HOCzOxSaTqoSzRH+1QDP4dEdqmfDiC5CDYrLCbptGk
         OW/SwT5PdwWEv81g2cxLj8sI50p7NPaQxxlxBy6l4j13pCZ7i1XyjO6yAan8dZmWGANo
         EKlBn7vvwLIGfkz46RD6VQ4dpWhV9YiVaVLF2fH8uq5YvhnYoLe08ScbcwiEHQBPjVRJ
         kNlKVVOzROuwgfLgZu6XpioIv4yyHGo+JdciIiH8+SfnTtGXXSDlvFmgtKjAid4HGEwL
         qb7A==
X-Forwarded-Encrypted: i=1; AKwUvBz3Hk4OAg3UQPMF/wtxKIoTARj1AkqKIfFCaraZQ52gnCvIhHSJD9PxYDaD4LdWuH13YkHFrmnPVskWTQVcRA==@vger.kernel.org
X-Gm-Message-State: AFuF++n7WDxwrz0XyJPdsJPanExmj0QVfM6cVESqj5nXTKvmzgQkKcSr
	TEswLmboTQBGA6U23d3ea6C5Cm06ysjiYOYz/OGMt0KFKG/vCLRVFkOG5Rs1i9B25DiO5LfWKW+
	cVN4KG3QopB9CujmCTvDP44u37DZiqV0=
X-Gm-Gg: AYBFou3bFwHeyXuJlX/8zeulPQaPvgdmmAbtwpNxNSPI93kSlxNtnMW/Ym1v+jWEHP5
	cs7cC4DB1LKIBbClsGWHXZamMsWLoKSc48TqN5A+XVaa+iVFDoX9KsOd7XU+Roz3JgneQQ9y9Z7
	62parnAaO0ylQdX2ZiXAfdbdmsJOodaDhjgMIs8WQRTU7qRGItU/zozb9gBtcypwfjBzF6Rl8U3
	uGPqhY3dJpfuhq+VkJuupwA0AOSB/6axnjZRmt9IYiuPhNECVE2+Fyd5OYeaGDt0aysqOZjuKfn
	U03eqNUjlDiFUP/RHGwFlCHR3DX/5kMEIx0eTLO8b3KcvMhWCacHXnD7tGIZQlOS6zxxBY3dD5S
	1junPsrVOpsLX8tvj6A5q81ec3ODE6adso8RGQDPi3Eeb1h4fRWPM5VC8SuqeHR0qtbbeWo8Hcx
	fpocbTB2PVZAEDZ4PwP/ko7ZmBgKAiyPKkyvK+esXAFCLgKtl6qns=
X-Received: by 2002:a05:693c:8858:b0:33e:8552:6e06 with SMTP id
 5a478bee46e88-34f06674f4fmr3627740eec.0.1790932619419; Fri, 02 Oct 2026
 02:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928183925.1315274-1-chenhan0017.work@gmail.com> <20261001042951.109054-1-chenhan0017.work@gmail.com>
In-Reply-To: <20261001042951.109054-1-chenhan0017.work@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 11:16:46 +0200
X-Gm-Features: AclHuK_Fpx0TmHbKgavcm9KQTeXzFEOzyVj7LRGa0JaxyZMXfVABnmWgeFa1L5s
Message-ID: <CANiq72mjLh2PgCy6m_gvuU8_na2jfVQ5QLFK8u0-B5sEPxu5cg@mail.gmail.com>
Subject: Re: [PATCH] rust: time: make Delta division and remainder fail consistently
To: chenhan <chenhan0017.work@gmail.com>
Cc: a.hindborg@kernel.org, tomo@flapping.org, georgeandrout13@gmail.com, 
	rust-for-linux@vger.kernel.org, boqun@kernel.org, fujita.tomonori@gmail.com, 
	frederic@kernel.org, lyude@redhat.com, tglx@kernel.org, 
	anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org, 
	ojeda@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:29=E2=80=AFAM chenhan <chenhan0017.work@gmail.com>=
 wrote:
>
> Yes. chenhan is the identity I consistently use, and
> chenhan0017.work@gmail.com is my email address.

I asked because I didn't see it in the kernel log, i.e. it seems to be
the first commit with it.

In other words, at least in my case I don't know that identity.
Maintainers picking the patch usually need to know (in this case, the
timekeeping ones -- it is up to them).

I hope that clarifies!

Cheers,
Miguel
