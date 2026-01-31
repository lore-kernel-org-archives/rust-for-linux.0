Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AC734F244
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 18:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769883180; cv=pass; b=ZoMUtqMAYn79exmehYxYemtDH2ICvd64/w4S1RhTRZVQLSB99xXFxq6r+w76VULIlwVGwZ47FgVBgsUa1NtpYGI/t7D0lT8sab3B9m40+rJ+k9bnjJ5uHWrJTMhrNZJ3nAvrr+paPQJprbyRFbiq72TI4/o7nQiD3RhydGaIOrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769883180; c=relaxed/simple;
	bh=doN+YqMCQysthtBcnuNBaL730r6pT6/zENymgqaabvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJnlh0+QRxrIJb22vSpS7YKzsgc3U0y9Ru/ic+PxaVfYCkBJYakOSpEdPpghwQA0M7lV0P2PdSAsw7CHRjFXUw7unaYoQFDxWbEnnaJpUk6fI1iUKxr5ZdC6n28wtkxmJWOnuktEp5hZwtu8oKwwgKglZ4Kete9cl+UXEMSPiFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqE1Ou4I; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqE1Ou4I"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b71e7dab12so154316eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 10:12:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769883178; cv=none;
        d=google.com; s=arc-20240605;
        b=YJ/+DSS3SP8LMCpIDUTpHTXHOALKublPKCDu9LLc8lDrPmvGbeIeZGPJOVoLPC85ZE
         Oh5pJex6I1ebnFpt5JiYWcMa6Yr4sp8WK3og4FMTFuNLL85wEXJ/P2y8vhgRWUqYcPAw
         LxvkVs/V0huYxrhBI6J/Ch+LgRgaBbAH4qoEYvieRWCM/NClsjaqzG/LRH1tXmka3thE
         WwIuWUgYoWbUo0nPEBbMkqiVU+B10P9i5+xD3hKuwz5X7ZZqpuVQAYqVKMpmTymbeLpD
         MaYfJUqo+MVKSUwZ3LHfIOXPrPfDfD94uWRDxRTuF0v0NInGCv+fWrPEdmb+L0+NhRK7
         1Mjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=doN+YqMCQysthtBcnuNBaL730r6pT6/zENymgqaabvo=;
        fh=ZxzYT/LD4Js062y/G7YBtkzO/H0+9aP43C7H7+aH8WA=;
        b=TnTMC5wiVMW3JqsB3kq+xE5G9nq/9qIn+cCBpeyVd816NnH4C23sz/G9CecHmzYBUF
         vM40lvanCWCNWqxz8Xaj6gcED1x826clhrRO6SiLNBIz2aceukvqEi/rvxVWqNUglcmu
         gVjbVXeJU5N/EPqSVcBp7BLX6y9eA/vmgX8rJXrqOE+6Ic/5wNWeAeqidGr9IEA3Ys87
         nhYpoVUkw9d6luFhTQOWhez4LdrgSxotoqHbMiiXiWka91jnZlGiK5hoo2wz27PUof+f
         uF3fVzFCGKyxL3zvJogN5/9UZj3OGmPx0MN7kULVVaktEjlBIu+Yy+ZQQACmt/kwy/nP
         oxXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769883178; x=1770487978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doN+YqMCQysthtBcnuNBaL730r6pT6/zENymgqaabvo=;
        b=NqE1Ou4IuO8QrjHZhrmd4r4/chvx0NtOJi4yqMvS3633gzBYlPUJQbv/kOhLBB7cPj
         J4plQgtA0QNh7h3u2QGmlWK4FlI75Kc0V98jHqh23RHK+Aa4mU3H29Tddqb6ucH1H+ue
         o5NSVJmSxb0H/mdLK/2CgEuP6HXHGid52JZ07TDJ2GFxux58wg07jwugvCo+x1uT9mwa
         4s+Cd4cETIq1KrnkEOJ2DBhAyEDWRdLW9AjQPjzNhiINLpVuNoEPn2kty0huZ1X1et31
         IATmlElGkoGTmHcR/iaMRLHOxIvsKV+EvFvsvL0F/9FKn1ACquGOdkqJtwdTOVw0IBOB
         MxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769883178; x=1770487978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=doN+YqMCQysthtBcnuNBaL730r6pT6/zENymgqaabvo=;
        b=GCq/6qK4i389UKpHlAwg/6bXhLslXlRBKB7MXNzdld3TvK0Y3jEdjlxS7gpCd96hWW
         5kAtl44No1Z19r1XYYSV3vK27Chlh5JVgOcdfQOz7wF+V8j3kwoIHQqMexftKqZ9Xjxs
         q70qHF2B/Zdg2mfyccJZx78iXeEgA3cBJOK+0WwsqDmk7CJeLrWhZRTU1hGLhnaCqLY6
         tK0BJzfErZLBnlaIryUhpqW9jWu6i9QL8I/pi4JYqIgWyUiRm5bVz98neSrAH+RQNqAw
         FFCZji919K37dRki8kyCavTgAz1CsXOYWgB//F/jl8HOHDJkL5/swBUUljCPNbGSfeKg
         sjPA==
X-Forwarded-Encrypted: i=1; AJvYcCU2L22ocycKlRf3c6oktkjVuMY1uNZBPAim2MOii4bwksfCj8mnys43FKQrviMsODGQBbCp7ADJXjDjYL/Skg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCHmZOHFx7qou2nn4CY5vUDancpVC7YxETdMTEIcVbcU1aEQgx
	RVkSqz2qvuZiyivN+YMgk0OTTc3bXhBRry+jrDTDX26Tt6fO/1l1Ny/BU4NfskiN7rof4GKbFM5
	7qRwK2Ls8SUdjL++gRC6gKniD44z+Y/8=
X-Gm-Gg: AZuq6aKu6BnkiP4E8Qc/lOHJGgTyiFgEC0JOCrMxQoANcmdTRJlXqlF5eXIdIDq0wsm
	n/K8GBJoRhHEb2LRkck9GwOvslMcVuk3wuh4auJS9dje7l9fnCpoSf8cCT/lNxU6IQk4VOjH0rW
	RVN48nYeRAddvhg7IJ6ShCDIqRhC57iM06towU7tyyUbuhMmpsfV3FIjbSBCOUGrNWDbOvRYMpo
	szb3wPu8QOkmAoTJL4LBPRbEkyQHpwfnkwEvYQn7Fj1IEVMlCjIMN4Pg6j/Bfy1pv6LulL1Ek6e
	mk/it5qhx5eHWcNItJcWqjyXKReRbFcNU/Lwo/t+nrZzj5kE1Iv/5FKkTZiw5U4aBksBYIcrHum
	JHRoY5NA8UD7XQ9kLmwE6vlA=
X-Received: by 2002:a05:7300:6d21:b0:2b7:b88d:b75d with SMTP id
 5a478bee46e88-2b7c852452bmr1622632eec.0.1769883178375; Sat, 31 Jan 2026
 10:12:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DG2WR3EOBWCY.DU3K4LRV4FUE@garyguo.net> <995384df9224283fab185b5e06f519506fff1873.1769877524.git.zijing.zhang@ry.rs>
In-Reply-To: <995384df9224283fab185b5e06f519506fff1873.1769877524.git.zijing.zhang@ry.rs>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 Jan 2026 19:12:46 +0100
X-Gm-Features: AZwV_QjbaNvdhVhrA4TUdX57i6Lhlgp4Gl5uCkJqb2l_YPViRjYzhboypmS9sxA
Message-ID: <CANiq72=8pjjfsAB9Y=Q8TYw9frmWtR9q3PzesXkWn6e=H8Xyyg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: pci: export ConfigSpace
To: Zijing Zhang <zijing.zhang@ry.rs>
Cc: dakr@kernel.org, linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	acourbot@nvidia.com, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 5:47=E2=80=AFPM Zijing Zhang <zijing.zhang@ry.rs> w=
rote:
>
> Re-export ConfigSpace from kernel::pci so users can name the returned
> type from Device::config_space*().
>
> Fixes: 4dc0bacb1d3c ("rust: pci: add config space read/write support")
> Reported-by: Gary Guo <gary@garyguo.net>
> Closes: https://lore.kernel.org/rust-for-linux/DG2D5ONS18FE.TC7K3O8V8SU1@=
garyguo.net/
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Zijing Zhang <zijing.zhang@ry.rs>

Generally, there is no need to resend to add tags (especially within
the same week) -- maintainers should pick them up for you from the
thread if they apply the patch (otherwise, you should pick them
yourself when sending a new version like you did here).

In addition, I would suggest sending new versions in a new thread;
otherwise, things can get too nested in e.g. lore.kernel.org and other
readers (especially when patch series have discussion involved and/or
are long). Instead, what I recommend is adding in the changelog a
lore.kernel.org link back to the previous versions (or at least the
previous one).

Thanks!

Cheers,
Miguel
