Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D57189F4B
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729760047; cv=none; b=IAWPZSjjh7CLFh7JItkBpSDMTnqGr3Sa/lb4+0ikEIAQ4JwwSwpOu0WeQHevDQHAJlYnSJXR3Iw95PyZLRvUJmg2+C+v6g2TGCozy2VIIz4gsQTLcG8jnasJnUNrt6xnvEsswi9rPg50bC4ULyrZG6cH699U0S93Mw0b4kZzafk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729760047; c=relaxed/simple;
	bh=7qn5xqIG5u5GiblQrbTPx9/mTPROORNnN3wkm5g9fv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tNQtn/DkN0EH9nAWxjiecdcKFeH9xreXfCjpT8jWiBQMeROwfaS+IVpZ9UuJHpi4/NY+3CY3HWJ4bzRKSRNvebIKUzW8TV55SJ/9lNwnUncpkZpytbmVB0r2WXLepzlFnP5zloGhWzY4SKRQLNZ2QpgOv+QUHzxGdH42scS969Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNpt6I+F; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNpt6I+F"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e2a96b242cso105881a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 01:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729760045; x=1730364845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qn5xqIG5u5GiblQrbTPx9/mTPROORNnN3wkm5g9fv8=;
        b=YNpt6I+FJXjBqgQlYADT0duPJp+l7O+ewrsho6/LoeUNMDiXAaBg0Z7M7yu/UM3MDj
         QFnXrKlKanOOxQBmlC04fHsFhIlOM2dk982JQZvO+vjb0oSKe4xcHWOMYgta7VphHLxr
         /+F7xCZI+NkS4RZRboJb2siNa3t2IjYSBRJgp3nx9GRxVPcO7dCtm7tf7EUA7yHp8sXl
         iW/SDYaGeCYs/RWa++CbaZ7kQ/WPCsFWphV3xmATVhGX+Gzuam0JU6ZwmnhUeAZ7mt6W
         5x0zPu+Gs/a4dqHp8DLbEZDLLddX+FnXkyVRmyk9F6H7TaMHoiB/pVI73chywnGRvZJh
         H1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729760045; x=1730364845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qn5xqIG5u5GiblQrbTPx9/mTPROORNnN3wkm5g9fv8=;
        b=Tg0J7DYkQ7tK3hfw+N+14utnV+mULAQTfjxyRJ729ZQAqh/cVpsJHwlhTYXKFgBeBX
         nYUojZkiMncA+4dpC4PhAYj76mTO8RMYLFvuGq/JbAdZ0UgN/KQDx606F9bRqYL2sh1j
         sgOY2HTr0lq384ZeZPSfsflGkK4B14RlwUkKitdq8MiMec/jqBKXjetZ+wQ3LeQP8MVn
         qbhw6T0CNRbiih+SqhFQafnpGuaJWSwtSHZ6lEE7PZ/cglrjnlCH7dUkVUKJAGz0/DCC
         9C6phtOh6XuN4rWBXZlQx8h+U3EfH49f8FEkivDrJc55hRFu/TTCFbvwyowY551gclg/
         azqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlJMf1kqudGS4uECq0JyPaKRYwUtB9Y1HoH/0PRsCgAWEJ81bxYsZj2ukI3CIYMK4hdHWatHtob3karTQXhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxKaBRhMoyyfgtEkjekZvyN5A7URf4d7MiXK5UjFOisHQDpmFw
	h+Iuh4UhTjsQ1/G5fLPeFmP2KaqB0N4WEJ+zTuwJW25+dwKRmZfH6AflUgEeCgdEA2vsRvED7dO
	pS1cKuX/fakC672sgFPNebK4d707Qeul2
X-Google-Smtp-Source: AGHT+IHU44hXxBO+HlIF/FpBVdIN2EcTPNggKC6eQdiFI0ud3+wbLv41y4+TyRP5KFkea92sUWylFZGa5V6ESn0XGNc=
X-Received: by 2002:a17:90b:4c84:b0:2db:60b:eee with SMTP id
 98e67ed59e1d1-2e76b74d76emr2676858a91.9.1729760044854; Thu, 24 Oct 2024
 01:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002050301.1927545-1-dirk.behme@de.bosch.com>
 <f7f65b97-2921-4a7d-b564-ff7479cad1ec@proton.me> <6e74f5f8-67aa-40a7-92c5-fbf478cfdebb@de.bosch.com>
In-Reply-To: <6e74f5f8-67aa-40a7-92c5-fbf478cfdebb@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 24 Oct 2024 10:53:51 +0200
Message-ID: <CANiq72mX4ayVoaDBX5w=B+s1jvMZX0GLfTJvrZ5TqBaHiCUS7A@mail.gmail.com>
Subject: Re: [PATCH v2] rust: types: extend `Opaque` documentation
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Benno Lossin <benno.lossin@proton.me>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nell Shamrell-Harrington <nells@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 6:55=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Yes, sure. I think I was just waiting for your Ack for that ;)

Yeah, one needs permission to add it, so you did the right thing :)

> Miguel: Do you want a v3 adding Benno's CDB & SOB and the movement of
> "`" above? Or could you do that while applying?

I can do that, no worries -- thanks!

Cheers,
Miguel
