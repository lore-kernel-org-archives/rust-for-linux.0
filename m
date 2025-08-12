Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCF32F549B
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 17:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755018061; cv=none; b=AfsMxzlhIKkWIHq0FfgQtX4thmPCXkbHoFQM3/xe4s/JrRWG4sHWUB7aKNkaWz1sdCkGTHDZqJNJIIyD/DLe+m/mF5yfJqZF6PG8dzUJEdcHq1hKBvS+lQlxk87+/DGMI5fWs45VmbzpAVs9K+s+Jati8DeHwvMKJU7ZFefHyyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755018061; c=relaxed/simple;
	bh=Y6mReE/g41d9fKWqqVq1p0OqIm22jtGc5KXUKPjRlkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMbnLUqmyiWoh5EaTC5S6tRmQgImsP0r+yZiR15T9hUFWdh5OmrrPYBEbemxcOoKYRAWLI5YlhHANs87ICYBqV7amwj09GvFj5SCILeZF5IekvhKLicZGK1a/R6snZjDpOqNV9vFbpocRj4XsfNW94gK8Fe/HZMvFyVtyVvqtMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOU8eXsI; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOU8eXsI"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76bf3e02db4so348308b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755018059; x=1755622859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6mReE/g41d9fKWqqVq1p0OqIm22jtGc5KXUKPjRlkA=;
        b=EOU8eXsITLMNg5GGDbJ4RYBdSVHQ8UWF+gOH/lv5+1onVcx2jbqlZ4wavxeoiQ9+RE
         LPOQisoz1iZOCQpDdRGYdvhplBsFZPdgMKqvsXUe2IRq3GtrV14s/3tVOx6LxExfcblH
         ILTZ488qW7CjvtSJBA50AEE+9GQvmFriaeXe16nwS1WXTqoNmfM7Ni6a2XhKc7E2caZe
         O015B4mXOt2fDXVHJHBCMWwJ6nxBEYCKuSRczXLqymcJp9cxG+8umykBBM8MjAqY+hFw
         m2y0oQ/cENPmRYWxKCDIaES817aqS7ynekjHCxBmWqaFgoK/w2mfAe42aK++er+iPXyn
         Iazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755018059; x=1755622859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6mReE/g41d9fKWqqVq1p0OqIm22jtGc5KXUKPjRlkA=;
        b=axKSSDzC4xo9ZvWTHc8QonfS0ls5M1e2YTASE1iGvh7GwMXJ6+0qIpaAy+RXObcO4d
         udCHWiGfTWEtr4Zi+75b5KOjBD/M8ikbjuZQU3Pd/yODdzzRLBudAjWxycPJevwfNycD
         7v1s2kAqob7GrkHZ9BBye8C/clZW/DKeIbjsA7ovcUcXv8mjuFFg08c/EvwlOZ98mD05
         VB3uvjwFQn8NwAk6zOKX/bBNAaqNH1IfPHgjOhGTAIGDxGk0IJDjJ/GVEblnAMe1PI5h
         2uUoykNcOIsbrfSW2DKTFmzri81Eel1RXpY7xtxmRDSxWA+D6N0PFtUk8Gy47ED8V62q
         aneA==
X-Forwarded-Encrypted: i=1; AJvYcCW1RRoRKPtjHc5obj0ZjsqQO8Ykq/z45OM+5KR/AGvqG4bYD76e8dAVJuyPi97AmcC6w+BTG6A4AExIzfeFqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXb2kGn1IqYa+T2BwBBTjgHmLTGWZhByrlOQtI0+GT84WBzNcp
	8Leo/sHuDXqrtJNYHsBo2v5Vu5U7jvPSob7bvUJdN+9dcsggeQijcdqIsWyB7AxyCE31xIr4GUx
	fLnre8EkArxGlXWDKOvNPE51ZXB+1lDIvrYgp/dI=
X-Gm-Gg: ASbGncv9v2y4a1E7KcW6Z5o5I8xHueM6eHK2Uh5QmnPTK5H2Th5mhFF0Qn/TBENsUGx
	0FQMDQ0+dj+YY+GFjCw5cqUjkzbqyAzGmZgRejpEeEK/JKmWrH9xXcTDu1fGQIfYOSfYNNTEZrD
	591uMPxS79MXb6H2kI+IDBTGmUNSfO3WeHLnfLGeffrdcY+ujFLlgFbNMa++QhMTSG61ZCqYoM4
	Jsx5jIC0ip94g1Xp2k=
X-Google-Smtp-Source: AGHT+IElJ/0myGyNQOJu8Xqe3D5jj6StTktfYQkmCyUzNgcLbABp9yHY27m9i5VBCDX5Ok9ufNKc72/IVN/t6fmthQY=
X-Received: by 2002:a17:902:cec1:b0:240:33c7:fbf9 with SMTP id
 d9443c01a7336-243072f3346mr13410765ad.11.1755018059004; Tue, 12 Aug 2025
 10:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACvsgUCBk5Dt2yBSy9_NA0z38-wP68vvBX7XDYgJGinTURT1kQ@mail.gmail.com>
 <2025081221-cloning-able-a6ed@gregkh> <CACvsgUDP8rX4evCbaNC1MTy56qWH655Cc2bOLuryUxfP-o4_4g@mail.gmail.com>
 <CANiq72nn+mPHWdt1XwQ-znL2ydMwWRN=7-9Vdq_5UkU8hFeqPA@mail.gmail.com> <CACvsgUDAzHfOBM73YvWbodsSiNM1NPq0DRvnW6qJw7vHVLJywA@mail.gmail.com>
In-Reply-To: <CACvsgUDAzHfOBM73YvWbodsSiNM1NPq0DRvnW6qJw7vHVLJywA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Aug 2025 19:00:47 +0200
X-Gm-Features: Ac12FXyNZCkEq42Ju2-ImXd-7SOFqkhZ789cIimglLVemanpiqTH9ojTVul6LQ0
Message-ID: <CANiq72kYxtXMyZEhZrHwhD+G8jefUNW64e_=qhq5UdYwcRUdKQ@mail.gmail.com>
Subject: Re: [PATCH] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
To: Trevor Chan <trev@trevrosa.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>, alex.gaynor@gmail.com, ojeda@kernel.org, 
	rafael@kernel.org, dakr@kernel.org, arlied@gmail.com, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "aliceryhl@google.com" <aliceryhl@google.com>, vireshk@kernel.org, nm@ti.com, 
	sboyd@kernel.org, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, brauner@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, jack@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 2:59=E2=80=AFPM Trevor Chan <trev@trevrosa.dev> wro=
te:
>
> Will do, sorry again.

No need to apologize! It is a common friction point, and anyway we all
started the same way :)

Cheers,
Miguel
