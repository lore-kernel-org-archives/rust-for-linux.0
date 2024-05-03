Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7156FB8
	for <rust-for-linux@vger.kernel.org>; Fri,  3 May 2024 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714748611; cv=none; b=RD4K8oQih2DZ8FW/IHkFl+zzE17ilN1eSX3WZS1quxI7RNA/nJRNw3Ym33S9xWcl510gRhYHVv7nJxxkeoXAxHVW+Cm0JbPxvgJqHjuRbzvAihYmBIl7CW/gO3yvMkyFhpKQ4yybDSGgqqELorMte6nbz7zgVu2p3lVJQm0WHoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714748611; c=relaxed/simple;
	bh=b1r7Jv7QR6u63mKEtKVtbnnaTIa90eUFGrtcTT/0dZY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Zu61huPRHJ5jnu8B6yQi7BRlLyVuEu0CrjBV5ict0+ExU2nlD2xAu5ahM493x7kFVrgtNLymO/1PSn9gFumSIu2kDw/Lb0oLHUjwdVF0O0I4/wx06GNRCsonHG8Q1sNi299UhdLh90uhmzrPWnTOjDFjrl3htjlwDl5qfzTF/8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J7e7T8At; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J7e7T8At"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-23bd61fbd64so3878302fac.0
        for <rust-for-linux@vger.kernel.org>; Fri, 03 May 2024 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714748609; x=1715353409; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O+TYt2ACU8h/f6YhcJDUo571JbO60mR74nv1lNkdCms=;
        b=J7e7T8At3UvtPMobTMYZsRC8MA7N0/yC+FmctxohZupxnJnsfSyE0ajpiJXOjfx3ly
         O11RvkqKYRKEJu7bHvhsKhFpYnMszB4mTR5RLcr9OIu46RD6PXkeI8klyPP65SM30Iz9
         jKGdY+7b4QOkRi/Wm8LGCgAe63gjqkhecXEm+ghXgQZFIhOMNFG1VpDLq2doGryvgyc2
         HN/VjCXqG/bpkG87TOtPSzDAhNqHbyu5MKEXXrVvQwVpdA3jMKiufxVm6gCcnydIs/XH
         GD590GTKTat3eRRklvrF7KYp07Wld/IESKipaaCBA9ivHd/g3jqzlR7QUizWtdtqxU8t
         7clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714748609; x=1715353409;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+TYt2ACU8h/f6YhcJDUo571JbO60mR74nv1lNkdCms=;
        b=DUvQhPQfTFCK79BNhh4nHbwrvhvb5qRv9xeMl3jIBVlxJvkSF3GASVDIJ4JsGS6ASe
         H2WxlnnSDMUUfzwcQiJkNNV344Ur8Q2oKlL2gLBafJHleVXWrXUqxOGd4i1zwahbvjXv
         RYO74n60UDVmOoW6PTTElxy1zK+4ed5wyecWtskakzdDFweykEwuI+yKbYLqF5nPraFT
         raJdufaMZr1TodK3SQMeH5w94932R71pG0r7Y7ha4dEQW8jQHguIVrQk5DdlHAfKwQ28
         VTKyNAMZuzXskh63gum6zVMuFl//IkeG8perY5Ouz4E5P5UDsZv+9922GTOUEfTQhmX0
         eO0Q==
X-Gm-Message-State: AOJu0YwAWqhKRynBEmLEs2X1yvrgUyGoNEB3KUin1goSVhKkApP55TX/
	ZOXZXOzNfIfq1tkcV1gBXx1yaOGapUs6cGKOhAFGOLUsvakzzL+HJ99sYqwXO5xtdv/MTfwaThZ
	E2q4rN+Tr3wR1AJiXNSjkcMW6LAgJoqVMnVcDuY59U6o8Lm1cfTIFHDg=
X-Google-Smtp-Source: AGHT+IFMvRWqj4rI1NhnAumTNcqYkG8SB7Wu9YVoXnuMbmcfhUuWfUixdYknfRuBml5ScLOB4LDiEDYvR3uVRXPSxLg=
X-Received: by 2002:a05:6870:a918:b0:23c:ca14:bdd with SMTP id
 eq24-20020a056870a91800b0023cca140bddmr3608894oab.47.1714748608832; Fri, 03
 May 2024 08:03:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 3 May 2024 17:03:18 +0200
Message-ID: <CAH5fLghwYAZkwjEQzhXK1RV6-J8SVBugk-a+OvjEC79evXdJAA@mail.gmail.com>
Subject: Bug report: Deriving zeroable doesn't work with const generics
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi list,

I noticed that the #[derive(Zeroable)] macro doesn't work on const
generics. I get this error:

error[E0404]: expected trait, found builtin type `u64`
   --> rust/kernel/list.rs:105:32
    |
105 | pub struct ListLinks<const ID: u64 = 0> {
    |                                ^^^ not a trait

Anyone up for fixing it?

Alice
