Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7EF1946DA
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Sep 2024 07:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523071; cv=none; b=Ff4clXT50S4y6Ds/Yz+lsbF76dUnWgYub8t/Vd33VL+Hc2ZHJGhmXDxXlqzgKOsa9bMPKvSmm3C5epGL55T0NQPN1PN85ZLSKCGJ00nZROW7GLHi2b+3LFgQR7+A2oZKOgtZ8X+gTIO1Wt4e2B/kwmzJIDZLvzhVdrUhhOiIlxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523071; c=relaxed/simple;
	bh=uzqoXNG3+qdG4fZg0Gqs2RhJ7NCXI4GO3eiiknmlaNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C60XQgAYe5iCDlq3TaOSqOylIsTlXJb3utB/N9fjTBp5a3pg71HKF3GfrjNCLlfvGY8345EmBFh7qHTDh5zIc6fA4IX87tfFhOJ093F6y+XvQ8R+Yqe82ZGbxAj/7RnrKACKKqMh4LqbWnw284py/bc8H3y+SFqRR0KG68f2QCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=biNdxn/R; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="biNdxn/R"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-374c6187b6eso263860f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Sep 2024 00:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725523068; x=1726127868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzqoXNG3+qdG4fZg0Gqs2RhJ7NCXI4GO3eiiknmlaNE=;
        b=biNdxn/RMiYcU5zUJyf9c3MiMf2rWAX0GkmH0Ug2zdW/mJKPq+8Yckt+pmiPv+CINF
         oGbD34Xi7YsCzzWE23y0Z7F+juwg6/n7MdTnVR3GQ7zCd/UFK4MFNwgPHy0qYh5+vpK5
         Yt5QKpNoO/B8kH6Y2DXyX31zsGjyg0W64evJh3X5SUOo7mQb5gZUvuIyuabPhUOKoOeg
         6Fd6f/9J8Hl6qyaQOtIDyyPAU4/7XYqBQMFLHHIsW+Xfw8fa/FlrGpAG5RRkoDW0PNcg
         GIcOXPNT9AK8n9+Su9NID2j2OWB57SSAqJY8LoUGCT1ZfplbFNzomp3JipripIbqUsMN
         DLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725523068; x=1726127868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzqoXNG3+qdG4fZg0Gqs2RhJ7NCXI4GO3eiiknmlaNE=;
        b=ETIfS0odLIz3Kk7ShchDINUaj+2chrA64Sr3IuDA7/gJTMwcrns/m2CGcFJSJqI0GC
         C5KoTk14LUsVr6GkHQnTfsUohkeqiwIHkV0Yf9ZE36XClhWMQLgJi5LU6+1+EoF8agL/
         KqIVsEr9DXuKakv6Nd9Zjjf0nk6TDpxdOFpwQudca/gkh/gLu1YTPrXvFT0Tbja2Ntvw
         pV4b3U2yVg0xuHfPHB3+6LYEJesk8QsAQAP57Hp1Hg8AyGQ0SKDz5bOGHIm7wmNswvBv
         3DrrjjFeXwJe0UDXvqMopyst6oSEnN4GAoCIE4T5owtq4k30lYuOYn/DgOn90o/j28Ct
         XedA==
X-Forwarded-Encrypted: i=1; AJvYcCUA3okgEq5xlp7j2b5hxzq3ECQD3rx5ahZ8Q0y2+LOBRhnCyAH98RaiT7hTLH8nYTxJSZ6a2fTkSVVtEWCaOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/j2/dwNH7gfbU65i9b+WdYAwwbBXAVortOP9LJpe8BaE1OjfV
	3H21Y7SAVwzhOLfsSWm1TBJ2OJsMeomZlmV0gmjOUj8z5yvhuiunKB4eI+c/q9PUmCy2zU2Eyhl
	gKBv4T8PKT6Vmr6Gsp6v1D/GWMa0w4axksBw0
X-Google-Smtp-Source: AGHT+IHTjzNnIL5A1Fd+8dZPOcunE+C0lDt4qQ8dgmGxe28nKfdYYnM8VoMndW494oUXHykAwYo0jir5Q6p0G0T9D5E=
X-Received: by 2002:a05:6000:4013:b0:374:c621:62a6 with SMTP id
 ffacd0b85a97d-374c62164damr10875495f8f.47.1725523067641; Thu, 05 Sep 2024
 00:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-3-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-3-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 5 Sep 2024 09:57:35 +0200
Message-ID: <CAH5fLgjte9RYaRMHeKfRpefPBkXuSYp8FnCq=9Ftr9eV+V3S2Q@mail.gmail.com>
Subject: Re: [PATCH 02/19] rust: sort global Rust flags
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 10:44=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Sort the global Rust flags so that it is easier to follow along when we
> have more, like this patch series does.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
