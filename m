Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549391AAC4
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Oct 2024 17:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728150618; cv=none; b=MkCbS6suAD67jq2e2mVD9CrgYD6XcF+Equ6UNLQf9eL4oiBeDM+NYEDDCKBq7w469htiJ2DVJlmU1zskUKUrCl2hVSDu1zu4CZBwx1EArnYy3drxaHjch21/kIjYOipNH/UhDxIk/ujnKVgqzg8GC7q2/7G5uedOascGAOY1VKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728150618; c=relaxed/simple;
	bh=WWaq15PPdb/1HnVUtV90Skpt2O4236Iyux4qkmFYI6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGKq+tIItRAkVDyb2TqKtD5b1/ZoF38HhhQln9Urxo3Ga3OH8Xp+hmeQJiyxDyA+IHdY9oxP2sNl5LvWj4WEfv0BwPdU2pCofu/G4IuTtgDOsnyTlRmuYU3oaG92WeQgBdFUrw7A1hUYu1azByJx6V4K62j7lYrtR3Wd2YVp4gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwZ9rCNh; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwZ9rCNh"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71dec222033so222132b3a.0
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Oct 2024 10:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728150616; x=1728755416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWaq15PPdb/1HnVUtV90Skpt2O4236Iyux4qkmFYI6E=;
        b=cwZ9rCNhdV+zHAPDqJ4RupM28uAEzCS8ANtAz70Xnc92M1lTdiYjyeVTyWorSCG81O
         RaTiigAXc3t0GGQz3RfksoSkhgrHThOI6usYup0fvSu9azg84ko5btp8dq6/uTMyReqC
         MOusUHRT3MuUuTYgvjdhp7tEe1gpDsMUrL8jxpx40Ud04Ws5clB0R5x4s+pgQPh/SIgU
         XDKkppQ3lOFFinTz0izUHzcZ8wyGcXQb3amxT/nf/oWbkRrxmQcKtFFdkGBXwrh++xed
         Htmc5RLs+XN2YLuYxrgpNhJJebW7/K9d8wFFqyT9KbHjHAbLdxUmFcKlA+MEnS6nLYPD
         dlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728150616; x=1728755416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWaq15PPdb/1HnVUtV90Skpt2O4236Iyux4qkmFYI6E=;
        b=fknqwbS+NfBv+7oWbfvXcaRaPb6/V+d/QJghupazR6eDjOFMb8tSbBq+GWPu8wXrVZ
         MMlo6Q9F9aECyp50ua8GFuQdQGKljxynWv9UMBzjM9wsz0kOA1+FZgoIElOTeFgW8jgC
         q1awTcWPTgLgpzmww+194RS4YDCDgwA0r+EowZSoYgKBmkjD/bzrCW4MtV0BG41FIsgQ
         0CwOLJzaN+6/x4utf8V+AVoLc9vS4HMqP3MimpP8bAlHUJNNVsxmkQ0lO+TABCEqowMX
         DADLbPL9xra7QCJ38ySZF+FfIq5pkAxdWzt82qoxd4DlDAJCJZ0N9efca1E52p4nEwMg
         0OFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5kLBT3rZAJUCgAkk7+215cU33aCN9o8brCuiuGfmgOCSfpTP3EmTmySdonbY5FV09iN7PY3J5YbWmMggcXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM3LTY3kY0KWR5vNndJyDQAdJlLhwJfsreR457XxCe6r9T1ux+
	zp3MPEr9+qQxSofnbBzBnDUxsa/X4B5a44Z0mOwJhXWwbbE/ZXqmzsh0aCAdmYj9rhh3j6xhpBB
	n1t0yqWV/vPbDgNpmoBIL6GyO/po=
X-Google-Smtp-Source: AGHT+IEmI19KzM/xWOVlv1Wt8Y8SBTl8IrhSL8WyktYA2812GWRjYVo5O/02lIhhuEqPWKvXQQP6Md+u9araxz32nbg=
X-Received: by 2002:a05:6a00:464e:b0:70b:705f:8c5d with SMTP id
 d2e1a72fcca58-71de2446c96mr4364840b3a.4.1728150616591; Sat, 05 Oct 2024
 10:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <BL0PR02MB491443BD775D5D63635C3F4FE9712@BL0PR02MB4914.namprd02.prod.outlook.com>
 <CANiq72mGJK==2YFnBFG06oPsrf8i3Wenx9zO9_WWWzvhRknh8w@mail.gmail.com>
 <BL0PR02MB491430823078BAD42FD56D13E9722@BL0PR02MB4914.namprd02.prod.outlook.com>
 <CANiq72=fsQ+dXEGDvxtKO7jk1dEXD_Rv98du97GNDChYPTZ8yg@mail.gmail.com> <BL0PR02MB4914E5DB9A7D8AAB13120D3DE9732@BL0PR02MB4914.namprd02.prod.outlook.com>
In-Reply-To: <BL0PR02MB4914E5DB9A7D8AAB13120D3DE9732@BL0PR02MB4914.namprd02.prod.outlook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Oct 2024 19:50:03 +0200
Message-ID: <CANiq72kbSsRr3bb5C5ZfgM=-+4mbOG9S-+cu2f0F7vpa95cuzg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: optimize error type to use nonzero
To: Filipe Xavier <felipe_life@live.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 5, 2024 at 7:14=E2=80=AFPM Filipe Xavier <felipe_life@live.com>=
 wrote:
>
> Before the macro doesn't use unsafe anywhere, but now i need call a
> `NonZeroI32::new_unchecked`, i added the `build_assert!` to ensure
> that the macro is safe, and improve the safety comment.

Yeah, that is good, what I was saying is that the compiler should be
able to catch that case during CTFE (although I think it does not
guarantee it in the general case, but I don't know if it does in a
case like this). So I was curious.

> It's possible, but i don't like how it ends up with EINVAL instead of a
> compilation failure when passed an incorrect value.

Not necessarily -- you can return an `Option<Error>`, for instance,
from that new constructor.

(You may find that you want `feature(const_option)`; but you could do
it manually in a stable way too).

Cheers,
Miguel
