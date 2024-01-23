Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCE255E62
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jan 2024 08:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705999695; cv=none; b=IG6mvsNsi3qBo/M1CnFoBtmtnjfQWojU57/0BRkdwSk3GqoXFBdFHzM72S5dTyIlZ5/NfWLl8WeOYkYHnB53ex5rtdH3O1lIgezQ7c5GNgdYBApc7gRr8CEWJ4tSRwePOU0Mdmms5HLyUircRr57bWE1ZrRvcppod1PDIjoVN98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705999695; c=relaxed/simple;
	bh=oIIk43+DJAe2iwTgwwTOunul9h3oUEPakmAZ0eeVHIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKOs6Pv+t7128h2oxHPjmBjEqzsRHm81y+oOhL+E2bb7AK2A2wHAFFdnbkBZDi0T7NhYfx1+Aeu/bxdBQL579iKEe66naaShbQEfHkmpPZy6RhYzdr8aFNteQ50NhrY8dGFfbP4fetheO15HGgWIhdktTx/11LMKdcYdv1bEsr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=ppJ6O6zL; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="ppJ6O6zL"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-60036bfdbfeso3699087b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jan 2024 00:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705999691; x=1706604491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIIk43+DJAe2iwTgwwTOunul9h3oUEPakmAZ0eeVHIE=;
        b=ppJ6O6zLfP+qWHXajKIbWjyyOLOBCGU3UyGInmlWOIc3JqzeXROLDLxmnei4Vmw9yC
         f84ymNtMBS3yVUUcVeYVFYhzwh2p9AXsml/l95v9ZAbCHhjRlFxYXJBe3Ii8qTWTTV2Q
         WBUWPomy3SYHhF+4FAKYpwVfSXx+g+4z5i6Dy1MaaPJW+irGZ1iZQZn7ySznIbQLzORM
         6toJzpGa2OJ9mA7q9cB6h1nfBpKSwrHWD6i755xp4b89HUvNDw9QY8tR1FbskLh6Ehr2
         SJZP16s7UmDsT8Dl+udanXwl1UKuAGVSqoTIJMuUSdoz4xvu+GxAIsT7q+9dSL0iL31R
         WVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705999691; x=1706604491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIIk43+DJAe2iwTgwwTOunul9h3oUEPakmAZ0eeVHIE=;
        b=HVZ4fBfcdErRfuh3molctT7GIBpICvsLbrCcQGoyxdknAWyANpaGXBXd7Ok9bNJuYf
         cGKG66cnbzh3tWaFDaImEhNoBjgio8hWfIOpCr/Nm/OK8a4JqmdPhTnpUbje0BZIgqsn
         FgtHzJIAMoY2S+KkFUPnOZDzwiftDwgUfmbBMxn+WBDLxqo/QS++iz0oTTHXhSIymyhS
         3hLzHcDzxlhjqvB7vpJuylQkiEpzS0f3tchi2uT16uE4aJ6i/jEXZwoF0OFIbRTVm6aP
         dxYanJFqwRK399JUvdXSstiB0ijRU5rNQW5ZVhHFbSViWLePLy02Q5wM8tQ241xJFauj
         PGvg==
X-Gm-Message-State: AOJu0YyRD520SeJJrBS0Ejjku4MVUttM0ueT7YpDTbomBquEAPDXLzM6
	w1c8yygvvjMpfAzTUu/k/HJPvZ26ARAm2KgobDCGr6acKh1YiQqlYWTLxC+f/RZKazCimJ+N0oi
	pnqo1ipKzVhkOubDbTmR30PYx1G18fdA7L/6gtg==
X-Google-Smtp-Source: AGHT+IEChzKDKw6UnhJFgYvb8ABrEvN6YDyugLATHKdVtonrDukDjRNQEFHBMEA81LrOz3oDq2eghsMspJJ5SeUk780=
X-Received: by 2002:a81:8882:0:b0:5ff:f176:9fd3 with SMTP id
 y124-20020a818882000000b005fff1769fd3mr2354485ywf.4.1705999690793; Tue, 23
 Jan 2024 00:48:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123075325.1270967-1-dirk.behme@de.bosch.com>
In-Reply-To: <20240123075325.1270967-1-dirk.behme@de.bosch.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 23 Jan 2024 02:47:59 -0600
Message-ID: <CALNs47vAj4=SpbLmeoND1EThJiOoXGDUtjN9E7D9tKDScdR+Ng@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: rust: Move testing to a separate page
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 1:53=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> To be able to add more testing documentation move the testing
> section to it's own page.
>
> No change on the documentation itself.
>
> Suggested-by: Trevor Gross <tmgross@umich.edu>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
