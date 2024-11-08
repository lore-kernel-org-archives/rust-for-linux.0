Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9521B1E1031
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Nov 2024 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731067808; cv=none; b=d2o4CuRCStme/wR8v9c9xXk7zYa3x3CfFd8uJeqyKrgRQkDu7CmNBoxXsHW1JgpYZQOlKHj6ojEdaSYRKPuZjUTqxBzUijudMdsYRvDQ6SLwbFIcgb1QYzGJol2bLb5tMaVBqRsKZcO+E3VLi21UhdwuizgEKSUtwaf3/mdxiN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731067808; c=relaxed/simple;
	bh=R81BZsI71BgOeWwjerT3qP2UQbm/pF8rr1yensNof2s=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=guB59pbYv4LUbuQ/SjbYaDPcTNh8MXHwn2tjbgFjxc/pBWqvCkoMRnSCbd1w7w3Uwk+ZtdOY7mLmKmWGjxqP39Y5hFajAgA+Anfh0tw/y+beUfN1XbndhC9azIfbyPyrQLVkKZdPp+EJir4h9HvihgjRWLaNnz26arJ5URuKP6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+FCOgpR; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+FCOgpR"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so1632001a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Nov 2024 04:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731067807; x=1731672607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R81BZsI71BgOeWwjerT3qP2UQbm/pF8rr1yensNof2s=;
        b=b+FCOgpRUqE4uO0BqGuZZiX3RnH6Fds5zeueWa5Al1Z6eSJnLx7ym7mCM5qjOWtq+U
         RLfVdn50TR1sOgfKvecyJb/XwySU2YV/4dQc84a+vMiQLhbZgGcxtdYsfH1Zx4Nm8l52
         z138b156jz/AzXlHw7n1GG15VebdqD8/2s6Yta/opfEUF02UXiOt+pvQozAja6/xCmDM
         OAZP1Ms4MYVApHkN0ZMezKwC4nXhfdb5gJIunE7V7NPcV947vXmyLfR5mdbornIFE5iu
         bTjfvG+Ks/bmzh/z+YVN+srKIAPY2+1xA9dAjU8goY3s6pqLW3I3OcXKNyGYIJ50Qcs9
         Qi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731067807; x=1731672607;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R81BZsI71BgOeWwjerT3qP2UQbm/pF8rr1yensNof2s=;
        b=Jc9DCARc8IMJ8Tv7Lma/eqKQ/R8xz2gxHJ72HAkg2HSkZtvQhmLi84x5QQhBb5V7zS
         MFQM8oBPF7/JEEtS9z1fslDM+iYvkFGQHBnXHDKobQUAL9hjpJiF5C5Sh75o6Z9NaD8t
         E+efZ5acFk21PbuT91WgB3XOQoLv3Zdse9kOos6XDZPUmJpiNTNK5TivnI4fRqTMjqtl
         NbFDt3L+CPbrtqbBdYhjgpT/a/yKdIeKvLCOsw+YNg4n39wp0FUGoD4jlud4VGibj164
         p6NDTIbTe9HRd56SDfc+0ZQ7gTKHPYCXEHXswcZZ0FAbYlFxk7xXPC6v7cinGY38LzJL
         CM4w==
X-Forwarded-Encrypted: i=1; AJvYcCVwAjAvy5PStCSVLQzVmM+9DyN+fo/5PNbCenPUdqwaCynwz4CXFQhPvHMrWWEmCHuC79nPHPnzcRvkxZiFsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnREzrO+vq9jO/uzrsZgwINXcH+WN0gQDkDjoBHoqnokEOs+C9
	Y7d1kAwEUbu8FDjVAT5eMxsahHyLUU6a0Kpg/zt6Be0zEH+TO77e
X-Google-Smtp-Source: AGHT+IFSd0k+FVltakpGBVvaF/l1q0BiL2qkCCXeJl2CuB+e0F0Mmdu3BSzsn9DuC//pYZKP/U7I1A==
X-Received: by 2002:a05:6a20:9c91:b0:1db:f53d:f0c2 with SMTP id adf61e73a8af0-1dc22b92d7fmr3747706637.43.1731067806741;
        Fri, 08 Nov 2024 04:10:06 -0800 (PST)
Received: from localhost (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f644036sm3229710a12.66.2024.11.08.04.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 04:10:06 -0800 (PST)
Date: Fri, 08 Nov 2024 21:09:54 +0900 (JST)
Message-Id: <20241108.210954.1389756675064563180.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com, jens.korinth@tuta.io
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com,
 dirk.behme@gmail.com
Subject: Re: [PATCH v2 2/3] rust: print: Add pr_*_once macros
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72k_Mcf=i+0WP5_VBV+vsgWoRJccNNgtU=BtNvoJbO1+Ng@mail.gmail.com>
References: <20241107-pr_once_macros-v2-0-dc0317ff301e@tuta.io>
	<20241107-pr_once_macros-v2-2-dc0317ff301e@tuta.io>
	<CANiq72k_Mcf=i+0WP5_VBV+vsgWoRJccNNgtU=BtNvoJbO1+Ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVGh1LCA3IE5vdiAyMDI0IDEyOjE0OjQ5ICswMTAwDQpNaWd1ZWwgT2plZGEgPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0KDQo+IE9uIFRodSwgTm92IDcsIDIwMjQg
YXQgMTI6MjnigK9BTSBKZW5zIEtvcmludGggdmlhIEI0IFJlbGF5DQo+IDxkZXZudWxsK2plbnMu
a29yaW50aC50dXRhLmlvQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4NCj4+IEZyb206IEZVSklUQSBU
b21vbm9yaSA8ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNvbT4NCj4+DQo+PiBBZGQgUnVzdCB2ZXJz
aW9uIG9mIHByX1tlbWVyZ3xhbGVydHxjcml0fGVycnx3YXJufG5vdGljfGluZm9dX29uY2UNCj4+
IGZ1bmN0aW9ucywgd2hpY2ggcHJpbnQgYSBtZXNzYWdlIG9ubHkgb25jZS4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBGVUpJVEEgVG9tb25vcmkgPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+DQo+
IA0KPiBXaGVuIHNlbmRpbmcgYSBwYXRjaCBmcm9tIHNvbWVvbmUgZWxzZSwgdGhlbiB5b3UgbmVl
ZCB0byBzaWduIHRoZQ0KPiBjb21taXQgdG9vLCBpLmUuIGFmdGVyIFRvbW9ub3JpJ3MgU29COg0K
PiANCj4gICAgIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRj
aGVzLmh0bWwjc2lnbi15b3VyLXdvcmstdGhlLWRldmVsb3Blci1zLWNlcnRpZmljYXRlLW9mLW9y
aWdpbg0KPiANCj4gSSB0aGluayB5b3UgYWRkZWQgZXhhbXBsZXMgKHdoaWNoIGlzIGdyZWF0ISks
IGkuZS4geW91IG1vZGlmaWVkDQo+IFRvbW9ub3JpJ3MgcGF0Y2gvY29kZS9tZXNzYWdlIC0tIGRp
ZCBUb21vbm9yaSBhZ3JlZSBvbiB0aGUgY2hhbmdlcz8gSWYNCj4geW91IGRpZCBhZ3JlZSBpbiBw
cml2YXRlLCBwbGVhc2UgaWdub3JlIHRoaXMuIElmIG5vdCwgVG9tb25vcmk6IGNhbg0KPiB5b3Ug
cGxlYXNlIHNheSB3aGV0aGVyIHlvdSBhcmUgT0sgd2l0aCB0aGUgcGF0Y2g/IFRoYW5rcyENCg0K
RmluZSBieSBtZS4NCg==
