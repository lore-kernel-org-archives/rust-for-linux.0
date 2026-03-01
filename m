Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15401430BA6
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772360219; cv=pass; b=AbQGtoa2+u9xhXV8E4B1tcf2PDz2hnlLRJJMI/nZQXd4RQYxAEUMkjVwAwMPQa8rQfWh+cwmd/HhseCHaBvHj40lXiyRkfRO78HF6eKNI6YHbW90ZIMP/qmDaalXjEVXIOezaFxFIwvktKOlvaGQXcQIypJGsia6AjxyiUaeeFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772360219; c=relaxed/simple;
	bh=MjAMUUuhY7RKH0+if5r7fta5EcdkO3xQ/b6WYVQ2OjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3niSXGocezeLleEeR+rs6j9G763+IAF2p7IftLgFuf5Q0VpeHd9FOt9lLUtOX50xPBBAUjZfiDSb/3tJJjcYLUWjcxdymN7Sugj6dGKmyZPplMRW9O6pMG+BOCMOBVtO581yImqxxoAlqWkKtGd9Hgw+/3X62dvxG/eb19fJnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGew8jgO; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGew8jgO"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bd801b40dbso258320eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 02:16:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772360217; cv=none;
        d=google.com; s=arc-20240605;
        b=U94BsaRBf9OxvsuA/iL8GVy5drKV7ZPvDk93xNv4UsQW1TM/YL/tUV/GQpwlcBALGc
         YJFP4CV2K4IrxD0j1Fuk0kI3em2sGEUD3GjdjNDDZic0E41AOpQXF/fERdVzth7dGD8a
         H3jwRaM+HylzkIQcdSqK3Q1qKpisdEdeK5KXhjxKwacwne1XfDAFT9QQHOVWlePGMQO7
         pzeBvAMmwYNXfZ4RGqj8Il2VPdl8nrRszL1jZeT1Ej1BDhFZvvmzBf3vHOz5aVCTyS4q
         DFVd66dJq2vKXLTGGkZjQihXDYeU+aPQIYNZGYCVMPD4EE5c4wwsc2BPKTQlTsQtLCG2
         nzAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MjAMUUuhY7RKH0+if5r7fta5EcdkO3xQ/b6WYVQ2OjI=;
        fh=TIsl/FpalWy4nsBt2Zi9AeR617Vmyjjuu2h0tAt+jSQ=;
        b=HorUXzIn7ft8pRF3SOxWfNcCuBWsVxCmweQFqHoPdu0DyxQ2lB0098/toV7tAvnlNn
         E6kaOMVrEnk0Wteqq+wCYPv2CBU0+B+IvgQZk4x0QEolAp3qaJbbK+DD0XJzzDx7YqOW
         x1wmCU6rTxqdE1NyFes3yrcC5zUymrZmsCGe/kbzawH0dFxl+2EzKFgbmTBfbk0WzjDi
         yCSZ5HmWLdVFIjWZklXdvtxSRoVezabxSJySQ59rGIIqvI2K9GK+YP/X1wYnvmf/MTWI
         ew168dhykvwNcKzlvd/DQI7U2dbHLXOJzu45J+VFBMR2TQKHktrtzfvBEwgbfuZGuHH5
         ohog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772360217; x=1772965017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjAMUUuhY7RKH0+if5r7fta5EcdkO3xQ/b6WYVQ2OjI=;
        b=kGew8jgO2Agl1tCE7nx734dogMtxHkLI2TGtIGSmtwwvRtsE/SeKeU5HWPtbw05HRE
         ty2pxsrr4GkqAZItE0g0khRLvrcfB4+5G0K+n6VRni3+VELwDtziQVOmkiWbk1C3xUgL
         INNMmIxO8uwqvzfrrJIAuXO2Xmb+o2xjhzIwcTmx0GnCnY3HTXlVZW43fXUDARUXIksw
         MztECgAel1PU1HAWWuFoY5FqIg+U74hZiCa10ZaHDpVSLPCPvdYevOi+8z86RCQIwGqj
         uZp57uAYQpQxNRTG35tepqtlnMf/d7LxAEQQVNGUi/AFe0nUq9uJwhisvfq5CxX1zPbV
         iBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772360217; x=1772965017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MjAMUUuhY7RKH0+if5r7fta5EcdkO3xQ/b6WYVQ2OjI=;
        b=hfS/lb944szJWZY5i675PKU5SHukFTzsAcU3kciMmuCjK8TC45PbCMmSwArJNZiR2X
         wekf89txEURhrQt0WxW7S1ELV88GuyZTkrJ1YKf6m/s3bGsepnyFpT0oGQ/I/r7FeAp5
         vH5Vchbox1r+jkDhkhH/hhyZQCXGxstAsRB9pQHPaS+ty5YDo5bYvny6YSKP5ODKROwC
         hVrPOEWTHxBnkbsrDgcrl15dsiz0YUUrjNFF2XOFXaGwXjP3MIpQq4hzs21Z5fFQXtT0
         I0Xc83qvfE+52XQUUkfXzhXH8toWojqYXKvb+BvhyglE9XmKDjJvfrfsM0FUsFqZb9/9
         8/jA==
X-Forwarded-Encrypted: i=1; AJvYcCV7Zu1OEmhxtLIdFA8adMvYGBEdZt/AqaryD9bPTybJ1X/4hpk9fbA1CJZVEeY7d6TOSvIi6x/dwiBNQ/K1eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+SPl4JxUpBuZym6oFxGRVwQpcYa9+oQwf0V4foFguurdRANv
	b3RH5vATiyN03l17rRCdOLQ4Ski6mM7HIVZzyRGqgxtW2BZ5YEq3UJ5D9/+iKrYFJGeqn3Vq6c5
	nibtOX9fni7LIr9c8upKGoWOcPpIMTUjGLI9l
X-Gm-Gg: ATEYQzzD3E3NmaRz+zJ0k3N40XHL7ZJJU2ZgYKRuSSXBHpBscNnwO+A9ZRp7DvXo91b
	NyecM6TbWOLwe2wcOq0sDQ19KLfQE2vVu/69SP8y9+6EkWJUimiYn1w9dg9887FYodJs1TlDvxE
	kUPMLQDoV9VAx2B3TtQcnC3eV4/g3gOryORhPceOsXPPDZ/woWuGZNZKEaYGAmJ8PG05ownW6CM
	wNNPG27NXJXfhA/KF55hk7GbqRMkE7tJeDRjIHYEkAOHVEelUlNyqly/FDZuzzz/rzuWTRqgbKv
	J6Ip9CcU2BtAg5meHrPApjBMZuQI0WJtd9RRuRzQKmJ2AooWCoGUqHif3gNLD/CF4xMopP/OqfG
	Ivu/ft540kQ7BPmvVi1IIuVspSs7V
X-Received: by 2002:a05:7300:640b:b0:2bd:d17c:b0aa with SMTP id
 5a478bee46e88-2bde1d4e9d8mr1793959eec.6.1772360217139; Sun, 01 Mar 2026
 02:16:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301013933.1700585-1-sashal@kernel.org>
In-Reply-To: <20260301013933.1700585-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 11:16:43 +0100
X-Gm-Features: AaiRm51-EeHPvScbrf6Wx5oLREbMPPYfNZwFV9k3-GP3PI172bbzw1BlkT1Q_nQ
Message-ID: <CANiq72m0yD=mt7CKvrp-EHcC8TmY4AEdY4J04F1mJM7foNyb2Q@mail.gmail.com>
Subject: Re: FAILED: Patch "rust: pin-init: replace clippy `expect` with
 `allow`" failed to apply to 6.6-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, lossin@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 2:39=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.6-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.

The Rust version is pinned in 6.6.y, so this is fine:

> Cc: stable@vger.kernel.org # Needed in 6.18.y and later.

Cheers,
Miguel
