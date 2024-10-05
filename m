Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0837253389
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Oct 2024 19:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728155036; cv=none; b=E8MaU7EYCoBiShcG/rabOtJpBbYuSckXrRtz0idSd/Iyncmt/aImWPCVqiZ59kDDFlQfszDWqskQjYM+W5XqUbRwlzQB8jhzNcZasbDSVRvldctzF/bgqlP8cHiq2vLlGyBuByw5UQ6PwqjVw1wp83yqHheNzoltTPzrVX+wUe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728155036; c=relaxed/simple;
	bh=EzqUeKRZDLhFiFH4joKB2jTVRWFzJzR1uoGfvl7WVa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YBKOqfHMiiHMoTFzRba2SGNsmQepdC9l0DU0um1fT7Yanc675o/CxgsFr+B3Bvu5m1/9bKRfA7KYa6ymS8w5ONCLCTMzjIna0P6dItRbnUXHkPN0LzvE9VoVteODhqMw5PlkQJAONBFe5dacA7bd/kt5y1ygjriG1dM4a2aZhpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CH+l2RRz; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CH+l2RRz"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7e9f6f5e7f4so231810a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Oct 2024 12:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728155034; x=1728759834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzqUeKRZDLhFiFH4joKB2jTVRWFzJzR1uoGfvl7WVa4=;
        b=CH+l2RRz5VH/aENa7C1ZSNAAhr8LD3sO3fX025jocRjW9d/+9EHkQRTRJAY6FOtPKK
         4WxMcgy4panEn439J9z5oQRhcC0XpcwS1ZEY8hk9KofnfETTm+BxAdHxk8rR4jZx5OQ/
         AYUUaaiHJpG9uSRmM/q3RF3qp31Xia7WVzNQSxFL53FV0RLz6bk5uCrXpkSlcbH7xBR0
         g6D+T9qYdF8AiyleOh8n1lbFQ4kmbfWHa8yrTomFArPgdfECXMINK9v4WtSybpxeNfTj
         7CT1hIye+XsD1lr4ZJFjr2Gyme2ODhuysWMx2/QLOFaQklZ8Lujayct6YGruWHsjU7wg
         jJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728155034; x=1728759834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzqUeKRZDLhFiFH4joKB2jTVRWFzJzR1uoGfvl7WVa4=;
        b=aHFEPCFi4P1iwylaDgqy0apO1gbdqck68pzKuIBR6x1g8poUrZNXmZRKW4fL/JK/md
         dqi3TD/vSZJEl+3VacbDNibVeR9Cglh9qIOCCMQ1ni35jmwOwQ9NpB5bJeotuS9/+fIX
         paVP5XrOAPxl49DhQHUrCHtZhPVnt8nUIsaoeDGIjpGOQ3Y3P8wvCQP/YZcqW+S6NMsH
         VfnmLJ4/l1XruA88W1mvZijpQR7FuDERvi2eoLdZe0kCMVo5k/PaXT5Fpg2KVDSstnkO
         BZij50k4RrsP4/SJF+9e3kSxV7JMLXZVs2HRhKJGuWtUIBcCI8DE8MbBPwO4E6zX8iCg
         3EjA==
X-Forwarded-Encrypted: i=1; AJvYcCV/auaD1jLYKRe/EIIbVzwwaCx7mP7y/DFUAnZ3NA7uD49CwlcfBFR59bubNOlJOBOWUF+ujW28E1Lj/iywmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBJolRJZb0KKyemqF0tUqssePdRFHW4tWLGa4QhoJLxXhPdR8u
	tZqu8bpUcTaMZiwBDWpPfENFTIA77NUt80Fk4j9EtcoHXupI++eeASypCvMKDA5HRAZK5ddH7Gt
	1msoqLtFtiypi+q14KcXQaiHZnGyw+7h2
X-Google-Smtp-Source: AGHT+IGH/Ya5qUnrayCLc0L8ieEGOw2O0MDKA2J4wc6xCeRqj3HwGGiNFfMQ7So4twEZE5xCYaQkqFLM7InFBpbrRpc=
X-Received: by 2002:a05:6a00:2401:b0:710:5243:4161 with SMTP id
 d2e1a72fcca58-71de2472ac2mr4504434b3a.5.1728155034308; Sat, 05 Oct 2024
 12:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <BL0PR02MB491443BD775D5D63635C3F4FE9712@BL0PR02MB4914.namprd02.prod.outlook.com>
 <CANiq72mGJK==2YFnBFG06oPsrf8i3Wenx9zO9_WWWzvhRknh8w@mail.gmail.com>
 <BL0PR02MB491430823078BAD42FD56D13E9722@BL0PR02MB4914.namprd02.prod.outlook.com>
 <CANiq72=fsQ+dXEGDvxtKO7jk1dEXD_Rv98du97GNDChYPTZ8yg@mail.gmail.com>
 <BL0PR02MB4914E5DB9A7D8AAB13120D3DE9732@BL0PR02MB4914.namprd02.prod.outlook.com>
 <CANiq72kbSsRr3bb5C5ZfgM=-+4mbOG9S-+cu2f0F7vpa95cuzg@mail.gmail.com> <BL0PR02MB4914709509DC2D92D65F5BE1E9732@BL0PR02MB4914.namprd02.prod.outlook.com>
In-Reply-To: <BL0PR02MB4914709509DC2D92D65F5BE1E9732@BL0PR02MB4914.namprd02.prod.outlook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Oct 2024 21:03:41 +0200
Message-ID: <CANiq72nwqnMCcD2TsmwRyps=1i1gpvP=z7wdfJNrFTJ+9jxUpQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: optimize error type to use nonzero
To: Filipe Xavier <felipe_life@live.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 5, 2024 at 8:52=E2=80=AFPM Filipe Xavier <felipe_life@live.com>=
 wrote:
>
> Nice, it worked here, what do you think about it?

Yeah, something like that is what I was thinking, though let's see
what others say.

Since this returns a case that callers can distinguish thanks to
`Option`, I would perhaps avoid saying it is a bug to call it with an
invalid `errno`, and I would call it simply `try_from_errno`.

`// SAFETY` comments should explain why a precondition is true, not
just re-state the precondition, by the way.

Thanks!

Cheers,
Miguel
