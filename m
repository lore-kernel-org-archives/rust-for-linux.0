Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8566C495C9
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 18:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705949887; cv=none; b=FG1Wdx6r4KvuFLJsUndCSuBaqkMvdWEIfDZTwH7FgNJ4s67kb29tSJm7HPH0quoK77KJKDsdusn838gP1h7NDLzc67/2LUANMVBxMBQQKsn8ylSuMr1PFbvBTMYAQXoHUiVu6XVyFf7W+prS6q95VrEN+uAN0/dcDGwX5GZ8wmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705949887; c=relaxed/simple;
	bh=VWOf8TrU3RfJgWEayn+bJz3W2oVeMtgyadg74e0TLO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBy3dbywbwONc4HdWPXiCjY4WZa2sudzLN82D6l8SfR86FjKqW/HZsc9wJZv8YI59sviPUZ7qqxkuGnDNnfsZwyHaq0MGF6kVQGq++pJ3bE4f7hj/Es/RwvpSjtLkY+anAIzzqDP1JnbV+4b4FyQ4kGFi7AWOO7DgLbYI/yWUCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W2Dvifm+; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W2Dvifm+"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7d2dfa80009so1083854241.0
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 10:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705949883; x=1706554683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWOf8TrU3RfJgWEayn+bJz3W2oVeMtgyadg74e0TLO8=;
        b=W2Dvifm+4/mh8atPmMbzY06l4rlAGkxKS+K46U8rUpotqjLrvweTfgv4qMtlxOA1vp
         p389uyFrAny1REMidvluyijHYFYYiGX0iaxWseaop9RUwCbujIrcADwX1aS+khrcDj9m
         uQgiXWeeGnCiAAeeqo8Bsy6YI/cRmQxqNjWF3vUICcdyA06G39w9TgVyiXTaGLy4x5op
         566MwrO9vyXgem/2N2KmiwsJpvpVi386mSUt+kVs8riFGuddf1qtPZddXLJJ6kTqcxMM
         /JbGG+B6n2maWCbQP/bmaXI5eiAnG6f7cA6J9SBv4bZWA2GVyflitaCWbN9kizUWz5gy
         Rqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705949883; x=1706554683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWOf8TrU3RfJgWEayn+bJz3W2oVeMtgyadg74e0TLO8=;
        b=CfzHHPvTXhCpQpg9fzDgjwdhqOh4JFprUN3omZJ2CHHBwOIMmdAHje5vlQLEeCs+wS
         +kHRpGLmFse2ljvwUhjEHCM6yPwNpSIGWrUnV2wI9923EkEiTyOLrpY+kWj1H+tlYFHj
         SXWJwXLiGBSvCczfwhPTxxsDz2JiFx+k59qQYZwbBvxYPHXNT1vr9+Ua9STi6keHkCiA
         mpgmp/umyvguj1fwKM5MMSVAEqsFMqAblljZuqsotFQX4zsylj+kgksQno+KiPkQU8ZY
         77MOpUWs0i3RRYHWILsbXxsDjX+BlzWci7ACMy4Ae2qP7a9aTUTgjrrXy2LpPWydJ9ZQ
         JiAw==
X-Gm-Message-State: AOJu0Yxe2t09BYOWdoTyGR+hQB9Fy5a6U4VNUv1u77On9m0uwH/COp63
	SFt63jhQxnGp+7nkSHpz09oFmgRW5Lmx3yEy0bQ55UL335+NUdxDvqLiroBcjsb9WtnfKqGXFFq
	5Mj1x8a32psEyjYE+b9WQtTxgAi2PB1syOIGS
X-Google-Smtp-Source: AGHT+IFxOVGRaBVF6braH2NOqEnij3IhJvpLMlsmKgtebpat1xtlABWJoGhlUaqjDI7jeA6UJ2L7nOY5Wt1qvz6c1nc=
X-Received: by 2002:a05:6102:3a13:b0:469:93d3:9fed with SMTP id
 b19-20020a0561023a1300b0046993d39fedmr3292716vsu.15.1705949883381; Mon, 22
 Jan 2024 10:58:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122184608.11863-1-dakr@redhat.com>
In-Reply-To: <20240122184608.11863-1-dakr@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 22 Jan 2024 19:57:52 +0100
Message-ID: <CAH5fLgjG5fJJQTsZF+ztT7E_mHAoct7p8BcERp2nkik1+LH+LQ@mail.gmail.com>
Subject: Re: [PATCH] rust: str: add to_ascii_{upper,lower}case() to CString
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 7:46=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> Add functions to convert a CString to upper- / lowercase assuming all
> characters are ASCII encoded.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

What is this for?

Alice
