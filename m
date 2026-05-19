Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853B23264C1
	for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 06:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172719; cv=pass; b=cWv9O3UBT4uby2oKCpZr9xbFe30QWqP+pGK0q0SnPWipuZmshfA+yTJgurjzOTyxsvis8qPywi629N/kpjivfnHbgFxGf4GaiMq8Fnz7+mRNWkrMhQBtcL3vrn6a8t1vKgmLT8i9j2C0KmMws0dc1BPK6olfAK2T7HeYCvhw8nI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172719; c=relaxed/simple;
	bh=0qcoTORhor/gDYJY7Q0+ZtSf5jR9sEJQ1TRR34MkASk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bbb4zxsibBooA19Ta7IrW68em+9LeyFMuv7Aa6Gq28lcPoSKPkrH88DXMp8Hnd8AHYA5WysQ2RwH3zpU5T5wuiU7NiMTWKgQn32llEm2KIXTxGD4E8drfvYb+nI+XkxyWzWTdplhcfZ494/11BWV6Gdsrs4DrsXdfblX3Gh/oZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfdmOpDK; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfdmOpDK"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-303da604df1so187686eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 23:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779172718; cv=none;
        d=google.com; s=arc-20240605;
        b=Q7k8MAdr4t27KSe8reyeGxnzMKqTpJ4uuBJC5t5mvJWTbxy0KwcfNEcFlw/IBglBA0
         yovZWSIVAs5/nLzuiwTk/Tv/We4QMS4Zkfq6OsB/D8mGSeQkANYh7wmVPPWtQ2wWdPWN
         wosWllHoeHP5enI1wH5fIift/1jiOY2kGRAfZc4zhL7LMPS0iprStjCzCvjqKrAgPobq
         ikDm/2Jo40zR0jof845X1ZhAjaCKuknh2shLKpZm5siGLzsCJWa8/bIJzPkMa+ebHrbC
         rjp7r8cez7hh/Wyz6sHIEkO7IR5zlD5IK7wvppJ047+hNIzR9KndRrU0QcMU9gMwMWQd
         A94g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0qcoTORhor/gDYJY7Q0+ZtSf5jR9sEJQ1TRR34MkASk=;
        fh=3qcjqex5j+hVfzwY3mQe6trezNTKHWQW9dYyIxbXie8=;
        b=LKyRkT+2AQzMKw7Wx6rQ3TZ2YW8Jjjo17+EpBlJAcg2wF3d0nuMl1GcKTQDi+z5MRB
         qVoZ1QaqZmzksgu+vONX96IpmnviKsVnmN/gA9Eh9topFdc9iQpauumesgukFvahwXt4
         pMdB6G3ylP4XdaAEm+LUwhgp+/FwNccLLG6NdbTBCMoqWPfzbidtsE+UAnrN6A2CeJao
         oI1drvozQO6Jjse5694dWr17Rg9TEm52arfN3/zFQOUfckpxDA8USL5mHvtJRKzoU0sn
         Dan6obqiUJDT38Kmq3N01rHFWd8ZzAtIQ8nC78Gfu3VRGrjKpyZ/xOMjsPT3urJOB61W
         jouQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779172718; x=1779777518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qcoTORhor/gDYJY7Q0+ZtSf5jR9sEJQ1TRR34MkASk=;
        b=SfdmOpDKyqmVT8VqeeoJU3P4FWC2QCsSxNyxnM3faXyyIhRWXqF3CFtlzuoHL42I83
         U9QHaz4cb6Rs7zpqdJsLdbvG9hbrv8X7k2ehsf/Y6PjNwHDpz4HlF0xZOCNMIUXNQNRd
         qJ7/3HzJBKNYRa1odCtYGqgJwRKeOAYGkiLHxLZ60UAtxT7dG66dSD6BfqK7wTLz7s8h
         6d9I3nt3BWUp+3fsw1AGvFev/13JXDR4Lwek7Pv2ToTpvMerQUrYGY1YiPRKwcTTVErj
         NgJli3pi3WxXDHEK0f30INYfyfJm43+iqYwuTdIEq9/kf/XXtNWKadEv29SyMOeVTHEs
         pivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172718; x=1779777518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0qcoTORhor/gDYJY7Q0+ZtSf5jR9sEJQ1TRR34MkASk=;
        b=n5bo6USiHxc09M5oAsfd2Nx2e/rR0zzc/eZc05BOFh9IY7T8YdMDftjs1xGkXHIcU4
         Qcs+YR5APHpkAWHmyI+QX7aUTZYOeFhRhe9lcy2v2Hm24dA5yafOaPhxcNCAC1TK1EJm
         A09xZZkHtbfA0G2CV5eOtMCrOVIIQA6LlJWyPIrfSoCylyqKjMR9tGiHnHWjWRHg//1j
         /C4v/pnRAOfeAryp3juvoaY0oOukfTPadW6mp63C8kWb/dy3A4GSBEGh8YoloURPdfiq
         N96LaRkTeinrrKFkaTP0EXzkOl0/EKXdmyVa1WBt1eD0J/ztmV/n+rv5W7pNEtMeNXCs
         4fOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lKaeRWpjuIweqyjKF8ULIoWDr3D3xVadCuOBNnH1MNkZhGFjZo18l/92mj65C6+zXmQ32IDWtZBYukjaf4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAPMALsS5Q5/oMcCpFti97h5Vo5hHu8Vu4ecOleBqiJd1zrvK8
	LTt1mI7VxDBgA8r0aHXnh3h2kMMaL/agXuEkJOybbuBV08kiUCzo5nP23NneTP8331n69Rkgdis
	7ouR5LdJvlnaq7hBy+/nY23JsHMV5GDQ=
X-Gm-Gg: Acq92OFLIu7HiKGxZqeo56XNAs+rVdeNYOAtcmMTFWut+vpjOx2/s8C0zyQHzcJVVEI
	PVFVXHqzpMt4SUIfLV8qmKhbr/wUC1D3aUnHIkg8AmHQrsTMTvBbe/4Sv2oNqSvPGjS7kITdLHV
	balCSz4KUIsQ7resZepHx0MFSh47JrzRo6upxujov5jMEyJE18/r+JzjKC+fsEKqO1BLVFEEE29
	nRjRI907EY9yGzGXdWf6I7sxPGyEJrHawfrG5Z2gb7vBmbQSIgYVhhzc49ekeVtf/SruK0JCLXg
	PW+TglHom1agx9u3lqSmArZLal3iYSAwc2jWWg8KJBWl6hfebXSgNwUudCmY2kJqR9Auh4kjI4+
	egUKHmS3oBjCHE4TR7wOLFFw=
X-Received: by 2002:a05:7300:dc03:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-303986626eamr3489121eec.3.1779172717585; Mon, 18 May 2026
 23:38:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512105920.2426293-1-japo@linux.ibm.com> <20260512105920.2426293-5-japo@linux.ibm.com>
 <CANiq72=dD5fw6XmLJ=zSq_k_ZQy8sLLMs3m1xjX=UTpO7tLisw@mail.gmail.com>
 <agst-5rhj2mFF448@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <CANiq72m0n4M=Yyb2=Hhrpg3EWk2-a2Q8V0Fc=0Ss50HuBO5hHw@mail.gmail.com> <agtnBewXZw83JhPQ@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
In-Reply-To: <agtnBewXZw83JhPQ@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 19 May 2026 08:38:23 +0200
X-Gm-Features: AVHnY4Ijo10OsLN6xtMCcuTqUYVDermo_oJ9SPMnGbScXPYCPWVI_GRQeGnWld4
Message-ID: <CANiq72kP42ONsFZH94ch34x8-n3MXJOPvW3XvFZV2=_AX-HOew@mail.gmail.com>
Subject: Re: [PATCH 4/4] s390: enable Rust support
To: Jan Polensky <japo@linux.ibm.com>
Cc: hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	ojeda@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, rostedt@goodmis.org, ardb@kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 9:22=E2=80=AFPM Jan Polensky <japo@linux.ibm.com> w=
rote:
>
> Thanks again for creating the tracking issue for -Zpacked-stack and for
> all the references, they were very helpful.
>
> Regarding the toolchain: since this works with the Rust-for-Linux
> bootstrap mechanism, I tested with rustc 1.96.0-beta.7 (6be5f81e1
> 2026-05-17) and everything behaves as expected. I=E2=80=99ll update v2
> accordingly (min-tool 1.96.0 without the -nightly suffix, and adjust the
> wording so it doesn=E2=80=99t imply nightly-only).

You're welcome, and thanks a lot for testing the beta -- it is good to
know it works!

Cheers,
Miguel
