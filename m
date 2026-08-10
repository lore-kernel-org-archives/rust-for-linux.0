Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0AB2D12EE
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368780; cv=pass; b=RWDaaW9AwOYXXtKd6qwg0RUvgYENF0uNgRdHuoADDJJCzEtNLXle+muHPtVntyM937XtOOilAiNa4kA1m9gtWJSrbYiAqnEYPme5vIFypnOo7jw5IZq6yBcHX5DmD7IOi+zB+PbcDgJPtOOY7hMv0woqpydcn0QBPEeeJCrmdrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368780; c=relaxed/simple;
	bh=zs7ev1uZCNzjpHhBWBorXCAL4i6om6rwL060s3imwzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqoAXG+pOBX24w1VpOIYmoeVcESczwiksPOYiH5iqrYlCMnJzVDTGW8HXoUbE9JEYTSy9KbSNdg4Xol0S42Dkgd5OD7Tw8FXvGgMtJE94UBQaWiA5iHfQKT+mIkilktmx2Fe+hPyidZVCvUqOup6aGko70NE2paXSqRlvkDTmP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LM4zhkSo; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LM4zhkSo"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cad85b7b5aso2077025ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 06:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786368778; cv=none;
        d=google.com; s=arc-20260327;
        b=sYrD97U/6UhbBJMPhNFiFaJ0c5ddQzYOfI3vzYuwC8f2gkLuuXnx1OC3PulFl3snki
         iF4zVW4tYSTfdoWiZAEDDmoYTsV97T54LLtH192dcPbzwG6L7A+cBlbY+am9nJv6G3nH
         OEZMAqviuhoWjLV/3cuP7ofV+anqfOkcYcVPa9VkNuS9bmG6hfYU24z2BdB15PQ3Msq8
         bnxsiGB7gD0U6Po/69WkUKzXC0o0OrmVwQZ6oQsnltFk/ike/DOanD6EyhnbSq1cjVY2
         RozfWAhOpGYAHDmN3ewuCTfdw8tKpTwIT+JEwHZm7pbngnRBky0PlSpWE6gY3WeRzxMY
         c6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zs7ev1uZCNzjpHhBWBorXCAL4i6om6rwL060s3imwzU=;
        fh=sHDJ5+dnC8H7xII+5riOFSYNt7Y+w/EJ4RTWj+bfL8s=;
        b=j1N7KhlHWadjCJQLjM80aFoSk5JBPm88rAMXAfhGriR+LJ397F2bqiBo9zROR99AzA
         lPaxGy/lhK5IYxnIxXV5tIHXzwJE02j7uo0TREsp9m8UBUUOMc74nr1pbk8MG41zsIuw
         CU16EJvo4HUKq+X0/y+VYTi9KoqD0DhJiteTn519LFu7Xs7UgWAgwNuggx6U+kAVEemW
         qeCQybyVD4Sr4gYFiNogFISI7OmNtaDD07WYs7S/e2i8pMBk3FfJWgrK/xGR7XXgzt8Q
         kz1/YZXJv0BVw3Qz2TXau/RvyxRx+eJany1oqNltobtw0pxc5BN2LcaanH5GJXRZ2Qbt
         IFKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786368778; x=1786973578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zs7ev1uZCNzjpHhBWBorXCAL4i6om6rwL060s3imwzU=;
        b=LM4zhkSoK7bAVEp3bAOf0bXmMJ3moXK8V/Lk5k7Mo6p1QvKB2njhKgBimXK1PFVaA2
         YzCxwp6hacYym5nGD/vPmX08Ok/J0ucANf7DNRaRc0swK2jjR33s90g31aui9V6BBa6U
         WBt9RLEk8phx71ojBpJrtz8kJ0UZCJPTa6bX/m2sInB7Lbwc3f/A1EDaVpTMRaFe8k8C
         /UCtLrB8ubGhCkbSZ9m5jMitIQamp274mNo9Prodt3yDukFs1haRNbM1IAXD4IDgo1cd
         o71BSzk7oiadhHg9D1GzLLffzInpoTDLaC7sJEb2NYNYs8kTFJV515s78ATuWJzZOODK
         c2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786368778; x=1786973578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zs7ev1uZCNzjpHhBWBorXCAL4i6om6rwL060s3imwzU=;
        b=Q1O3JZbJ6wenn5Kh1mlalkjMDzXe20JPXDTGZfUcRK0H9FDtHE+AbIxGwu114lMD6s
         ghMnCcPDHx2QNaLXo7cv52Jezv3IE9BSpW+VDv7Gb01ihY0g06dNLD9aPSGDY5bXCu0J
         JA8P2nQ4eg9WvXvSYC2pYlZ11lVEobOPUmc9z07jqQyyoYTwvoizJLISlYp4MbU4m7x2
         YSIJ8uYB8vFBKKGMPQFhuGW9pSixnLga6P8hTohVV09Dj9GqTTS5xhPzZQjNNvygPmYA
         qZOvjmJgOyer7VkZeXNe2OpYEd2wd4J8Ybli/hfvQkK08ofv+KDzlR0dx/+fXIP7TnDz
         ADPg==
X-Forwarded-Encrypted: i=1; AHgh+RpWO5JWUqjAxFerGtf6RSLokk46LPjs/DnxAqqwNzDnqrCHFPLE0P5Zv1hA81F/CO9OphxDSivOpSeUn+/P9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJzfnFgCX1U155XvAyDGyntvjp9WdWVaSINQ2vhQz7eIRiCgFE
	WqG/RLu9AMtjcNbzj2OHfF1EPgHtZmIuzk6gF/z58IvNHz6MRmysFR5xdzKDwH6eOTM3Xj7qo52
	7+WD7VM90OOggOyBPsz4t28Mc//R/wQ4=
X-Gm-Gg: AR+sD10k3TAQWUGDfS/+FUkx7oGcKdwfPOeu1rfuLoj8aoU7csHt5hC+Mmu/Ei0Rgt1
	Doput/Rp2bbbIZ1r9E7GfPGtv6O5HqEdTXBMMnzLrlMw2gFueQrwtcyM8LnNSFiwsrUP+zwDXv1
	tKifxnNxqeK1WfvXG5nBFncQN5142xziw0EFWpATeGxYB7H3FZK6mwFDnUJIjJ2eJHEFhwRRVVn
	s51n5OmVgNXwcHZbUXCq7wRRD9QGMvbjm3SxnDhTaYGUKvxdGRvzw6b29qVJQ3dRDHfoaDcKPRr
	QI8XM9WXG5qTtppJdAcaE0eFs7UVCAYh00TEqLAJ+QxCFOSObsRUx+P2D6nMT1sYhoCb0b2XUK2
	q6PRE24zfu834EChGGuFwbhWuoCUTzHMdtWCaI6E8HVrCJz4/bd0Mi4fz3RoH
X-Received: by 2002:a17:902:dac3:b0:2c9:b96a:2855 with SMTP id
 d9443c01a7336-2d0ca158b88mr319780985ad.0.1786368777744; Mon, 10 Aug 2026
 06:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Xb3BqlziN0dz1513y4Pf4QcsWU4wtV9yldqqJnRxpJpDfcu8sMggyUlvbLFPRAVBPyTI698uvBbWntyliXl7Qg==@protonmail.internalid>
 <20260722001050.4115708-1-tomo@flapping.org> <87ecgc96gy.fsf@t14s.mail-host-address-is-not-set>
 <20260810.223116.480833962545427592.tomo@flapping.org>
In-Reply-To: <20260810.223116.480833962545427592.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 15:32:44 +0200
X-Gm-Features: AUfX_mynLwy3JHYHlRMrpQZb58oI1NQcRCUl6tz905iqpk6P6Qz67vMk-DlxJuE
Message-ID: <CANiq72mj2vTKN7QjqyDgKq4w8cwPWcrYsx3Nc2Hk6kceYDbLkw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: rename ClockSource trait to ClockId
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, jstultz@google.com, 
	acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net, 
	lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, 
	tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 3:31=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> Thanks!
>
> Miguel, Andreas, can we merge this via rust-next?

If Andreas is OK with it, we can try, yeah -- he was mentioning to me
earlier today about a few others.

Cheers,
Miguel
