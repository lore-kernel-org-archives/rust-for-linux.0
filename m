Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34D519CCF5
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 03:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766374234; cv=none; b=UxFqt284qTFzCR9M0wh3SDN8anSYkVHQJnZv6enWBGXyDxjm2gwSayi3+NOxH/2/C+KawsylNY26B4C6ZWcc0jqraRujXUPx1St4ROVftI8VY65aDVkXlMuthXveL5sdAUFsun8DDeWfu9SjZJIRwhOl2CqOABqmmcxU3P62tas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766374234; c=relaxed/simple;
	bh=0sEgOjWNYiRpYEbqOkuzrHuh+/Ex8OeQWPYb0COe5JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lboehxYJHebAOKHSlkF5xDkGgcsF2mR7IitCbGXjlR08uj8AK6ge6LYI58ayftvRYVgbHmxQOqwDoV70xU41Ai+jrdplaV8T/QfAvvyEItONrgJFhBCX95jjZAU2OkWHZBe/bt9HBfIi72YA8Y6Tgd6xeuDzHNklLJPK8l81mZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+PDF8KK; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+PDF8KK"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a08ced9a36so9095075ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Dec 2025 19:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766374232; x=1766979032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COBSDkeJRHdKZMKtQx7qei9g/N9OMGNmu1xizfhqNYM=;
        b=F+PDF8KKgAkHduP3VPGNWhpLWxkZz0ykZwKbwPTiTwyvx4J/3y8iOKhBgTAdt4EV/l
         giQhTCyeiRz58THOpP5GuyHBvap9PHnflKAO6fsGiJU3QGLUpO/ARF50Wt8XFV+PM6ly
         u348dxLgpmICJJU5XA/n2Crag1PWp13FztQpMFQ3dDyq0lyYhslvLwwj7twre6Cm4XuH
         ZdkR8waivKPr8Ty/L5DHMLlPpcKN2vnLL5U1ih7IrLCchWWaV11uSqF/aioMHtxEuYtu
         LnEsqNanFd0VuXOkcvc7ZqA4UujX3Ku9mn+8BuL7nJOqbw48P31a+qB/kshb4BXoqYdR
         yOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766374232; x=1766979032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=COBSDkeJRHdKZMKtQx7qei9g/N9OMGNmu1xizfhqNYM=;
        b=UlmvtpG9i8VKE4DuZT0uGoMQ8fwyQLXk8oSsPg2WOXfQaYq/JzlaUDTQrNZcFX1U/0
         E2+rvBQD1X1kzkBldvnbo8pGxyPwBTPeDvyg/0IosdaIE3dApI0r8pdTJG0eeOF183uz
         rjOzUwiXrfVK+x5VIFzEgG8U6lNwdtZVNa6xb0WrW4HaoilkJ2ksUMSN4VahHF/I3XG5
         lxHRnt2jYFldt1sJIFF/5khKdBfLmS6ExUI21RzZ8V3oH6Xa6m8BJ7C7D4Oaxul+8Y+q
         6d/zZPxiA5i8G+3SH+AHjy/yp0613BYBWiy2uZcm/5rLa6OUWtbMLZC78uro6/XDEzh+
         sAvw==
X-Forwarded-Encrypted: i=1; AJvYcCUI1kvi5KxqRLGs2JBh/K43ujrgg2qd6+svNax/bMIZej8n+JeWBF/I5nooSDfT76bkgbMz4f4o/m3FrA1htA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz/JFczQf3LQyWqSs2Hmuov3XF49S3mcKD3v+Ylt/OkuVyHHJf
	MkMgHF/AX8kfR+1orXV4IyB3D4yzWsWx5FYhG8bMRNfoHGNjwM/Y9EzAgz5MXYQmiLdQAA1rRu2
	pDhPeYfL+fsSykmkYrhH+v+sTSobgm8I=
X-Gm-Gg: AY/fxX5Haxk5DZyJJV0LIUzBjUHUOPpJieKf10V+Pa6dbxMoFbrJMVL2pN1TF6lUT3H
	eYnt2USwlIY4jwecNMeUZX09F8mE32qKmMK5NzRkXRyN4IR2EZYX4DqEhCHFSJBaeowSniKeNPx
	5AU8ODv77S/+iob7+wHLC9oTb80+J5jSwydy7dY5imtrJ/PbReRypoKmItdpsl0YQQe8t0Dg37a
	R5eu9dCpF143cADPyiXfKCQRy+cXHFh6DVxx7zU4yzYX/08C9B4x4N7rNA4wjyI32m/0g6vDHO+
	jkwBrYClo0a9TigJB2OHyUfRLHYY0WW3JbagIvBYAxY7QNvGrBHwtnGpHJC2FKWbsfvyto/eWt+
	mT1v9/fefU3aL/XbWViV85Bw=
X-Google-Smtp-Source: AGHT+IEwHp7GiTxzNjQa+1kWbGxVcf+HWSVN1hKAodz8N06a/N/cWQQAGQMNADFaWCws3ABO/rPUi3ymBQAn595hUMI=
X-Received: by 2002:a05:7300:4f9b:b0:2ac:2b5b:a567 with SMTP id
 5a478bee46e88-2b05ec47be3mr4112576eec.6.1766374231860; Sun, 21 Dec 2025
 19:30:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766061692.git.gtucker@gtucker.io> <35b951506304b141047812f516fa946a4f1549a1.1766061692.git.gtucker@gtucker.io>
 <3241bbcb-d9c1-49bd-b8a7-610543dfb454@gtucker.io>
In-Reply-To: <3241bbcb-d9c1-49bd-b8a7-610543dfb454@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Dec 2025 04:30:19 +0100
X-Gm-Features: AQt7F2p6PVxe3-97y300_XoLgtbOQwn1v4BhwJSxqspmpx2ZlG3l-w_-sXw1ElM
Message-ID: <CANiq72mtqdR0EU9GM6yu1-Rn0V98ZftUA814eY3ue2YH1xdNHw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] scripts: add tool to run containerized builds
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2025 at 9:19=E2=80=AFPM Guillaume Tucker <gtucker@gtucker.i=
o> wrote:
>
> Another piece of feedback from your v1 review was to add a link to
> the documentation.  As it's not published yet I just mentioned the
> section name here in the v2 - but I can anticipate what the final URL
> will be i.e.:
>
>      https://www.kernel.org/doc/html/latest/dev-tools/container

A docs.kernel.org URL instead may look better?

Cheers,
Miguel
