Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420A1516154
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 13:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862232; cv=none; b=FgPG+qD7Mm0FVFQkGREu36AOdwfe5kwBs6rWAByjISVOKl41dBcfKG7DP9Mcbk4MMzqrC3oTj2QqQ15mBtWnAya+T2sJMLxkfdmctIJPBdwnEjsCvHCNE7tmp7VVJ5yzvtvK3W+tZ9Lg9g15Fvh4L57uNBRp57nLdA+TM0hy/EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862232; c=relaxed/simple;
	bh=YtxTa1VgrUAUHV74VfDLuMxfbVAqObQYg4zUaDxY7zM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=CnwjpgXwmfdlsXBeXjjxMyMGpy1PPqfkJ58ERtuJjMVYoKWVUfEVg16yoxgWYgU7yoKCmVacnzYhA5CA+Lcy+Tum1eOyAtBVpIvOjy5bqlSMeft1rIeeHPJFqWh94RHO1NmLrCFdSqt/sVxMnA1G8GG6DNf5fEZlzIU9KrgneYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VO8F8gxJ; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VO8F8gxJ"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8ab748519f0so30763417b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Oct 2026 06:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790862228; x=1791467028; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YtxTa1VgrUAUHV74VfDLuMxfbVAqObQYg4zUaDxY7zM=;
        b=VO8F8gxJeZ7wLqYG+Xjib+qHJW/Y6FBR6NNGchHrCBPwSgpBsutE2HrOmARDM2yOUP
         /bL3HhegEC8VPqdGXVeeID1kQW37rrUOubQC3l08KWDc+rbxi/6XbYK55SanMb0zS/YG
         Axre/w8xRrpZKjROzAhBzgk9TSjLNy6/dZkkWhbCNLhdj2JCYUDz8DmnRKLmwzzjTEtc
         c2raAbCRf3Li8LribjC2XXd2/ycfEb39fgsoeTiR0VUKiZFl8pRGNrKL7G7K/mYxLPPt
         ijfpp+XTN8sweFUABZgI4t+Cb2kDen6obENTbXWm0WkRKpFbWzOrhXW8QLe2V834J1HI
         LqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862228; x=1791467028;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtxTa1VgrUAUHV74VfDLuMxfbVAqObQYg4zUaDxY7zM=;
        b=B92lT5TF7eH8sU4dRkDM7TqL94xIPdmS34d0Eea/envg0Nu1lsV1MfeNmBfqy1Zpdr
         n5AL7WSiI6g9rmhQ6F2cf2f3rpspc5+DjA1KNFlzbbg9FWiSQE24ztnNa5v1ycWKfzGT
         hpoP+CgofO/xsde+NfbvXS1nmpLS0z+R1rs1ywG8Ja4a6yx/CBUChBR/66kqmsrMmldy
         JmkrsF7ttSER9zXz6cNHiuBYO+9rGZw9ji1dVFeEIzoLh7nqP/uewow4ppMP9TgvF5+x
         dQPmuT6ukCzovrQdnJ0eXlSMViLtL5oS9w9+v1jNcp5itFfpAkga9ldvbTV3AmaMUZe3
         Pivw==
X-Forwarded-Encrypted: i=1; AKwUvBxrq48Ty5FKNQ11Rwa0ej4fD2umFuoRSBKIlHMiMRxyzgNeGy0vcurnPzyoAg1wIoIyRvJVdeedy/FDrGQgag==@vger.kernel.org
X-Gm-Message-State: AFq9FYLJL6u+hIuljBIWCF04BR6SCmo+YmzaL7WytBA/JpIhGxLgVsnL
	NXKenXJYbfTbFjc1ywj2aWLfL4Fkdf6FPJ2VuD4PhV3QojlZpxy11Ek=
X-Gm-Gg: AYBFou2l/f8PtilujV+kRFC0TZXf+0xODOjfnUaTR5JKvJ1WbCy95y4u14BCdUJewYd
	7gQ898r0VzfuaGJDCd0Z6EIXxfX3u05dKVljSzbkZUDnlIQbOIL4zCRSZSDYtV7Izdh6YOXXmvF
	ucG+bCqj4wGhRbA7JfeGQoTUwC3ldQkn9PpV09hYRJzXEeFn6cIAoNIBfaQTAapzMbID+PRxk1Z
	7CYW3BNAl4RfqPa5Sb/6kHL0dKKp/aIjs2m9qElIzrO5Vs8x5VW6chKxL73YK+qvGv23Uep5qRO
	qS1JAuc6NU40E2DINkSW201wdu1VzAnlSIqOAJHraezFK8Y0gOQFrOpByvLYNN+KCMmt4a/AREa
	ML+r/q+ORyrMq1dqEJGxtNkuFSuCxMx4ffJ9wIlgmkuGEq9PVfnFhWxWF3JkxKR90yJFjQhHTuJ
	SEZ/cR08yGJdtlPRiviRSD3GnBzF3P6z+j5q3QYi0zteENHkUEjmtJlRQPCYzhCgG4+OIY8OtVI
	n8+nyT2PAlUIrGuVROazcEizLXOnX9+3EygiEw5KfTs
X-Received: by 2002:a05:690c:c353:b0:8a9:a268:d719 with SMTP id 00721157ae682-8ac93fe3e62mr20075197b3.66.1790862228362;
        Thu, 01 Oct 2026 06:43:48 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8acdaceb3f6sm10232417b3.25.2026.10.01.06.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:43:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 10:43:41 -0300
Message-Id: <DLTJOAQSES8X.3ONDW2BU044FQ@gmail.com>
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Burak Emir"
 <burak.emir@gmail.com>, "Brendan Higgins" <brendan.higgins@linux.dev>,
 "David Gow" <david@davidgow.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn1_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Jori Koolstra"
 <jkoolstra@xs4all.nl>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Rae Moar" <raemoar63@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Tamir Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Yury Norov" <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
X-Mailer: aerc 0.20.0
References: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
 <CANiq72k2RfFBncNBCGGdWFEJ-wWZ1MzA8ErrBDAcAvbGSRaS=Q@mail.gmail.com>
In-Reply-To: <CANiq72k2RfFBncNBCGGdWFEJ-wWZ1MzA8ErrBDAcAvbGSRaS=Q@mail.gmail.com>

On Wed Sep 30, 2026 at 11:41 AM -03, Miguel Ojeda wrote:
> On Wed, Sep 30, 2026 at 3:23=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Rela=
y
> <devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>>
>> This patch series intends to implement two features for KUnit tests
>> written in Rust. The work is based on a TODO comment made in the
>> `bitmap.rs` module [1].
>
> I am glad it worked with `b4`! Hopefully no more Gmail issues :)

Yes! Thank you very much for the suggestion! I'll have it that as a
fallback mechanism for now on
>
> (Nit: in cases like this, I would suggest increasing tagging with
> RESEND or maybe increasing the version to avoid the same subject line
> in Lore and other clients.)

Sorry about that! I had the intention but forgot to do it

>
> Cheers,
> Miguel

