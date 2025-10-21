Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C72D342CA5
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 15:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761059310; cv=none; b=hXHn1wYVyZ8m8X74UjBWApSPnlJjZMcS89sHhfq7bMoIVGRKSogONH59QQPBt78bRi6ENqUVNYNotr42Cj9oSLfC6IJD3dRsiYDfyHspldGlh1jcgfk50KoyMUOy6IG8pUiso/OgFP93zU6IpcAeWJFtvnJ/VW66uOJnsiZbYm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761059310; c=relaxed/simple;
	bh=qFg4+yNAZ27UrKFa/0jY50pQQ/TyaCnL0WzY/AbT3Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOCiOg8NtETW+rFXKf91wIol/zdJ7nv5IapAaHbgrjn3DtSbk2OrnhEjRh0Skd1zqsrjRm5rgO4U5F+V8oARRb/Wt0tfyvxlwS3hnhHufJ0fu00KK1GF2ZBqQHeJiCJ+4yJCfbJA2UU1ASnTngE9d2ymvSSbb1IurA62icwjtdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDmQNpyl; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDmQNpyl"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b631a684a9fso420518a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 08:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761059308; x=1761664108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFg4+yNAZ27UrKFa/0jY50pQQ/TyaCnL0WzY/AbT3Uk=;
        b=GDmQNpylqDx1ao5zQVD847VGaErTwC9mikxRVUvxuQkmWPTmtaWf00RSlc40/i+kQo
         XKfjdgsq9RUAcjdjyrXvf+g7lvZwAmLrzH21U2JZsI8Xe4hG5BUajmvHwJ5B37tiri+e
         VRviq/6rBOC0/4MIRCOD64U7lRo6Bndb/9TMH3MYtcRcp0Zr+B3gRkD6VV/pVOPwPrgr
         X3Prcmrwnx3CHQz48nQJ/PlpbEwBdRWpL7hOFaNLxEyaXi0qJtkMkg86nlHDtJM7uIKG
         iXtTUI3s3UWtP6mL5uqDpvIz1wlIaIfYgF5MYOon2T5l3wxvrI9N3G+9DPze33/14P75
         MTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761059308; x=1761664108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFg4+yNAZ27UrKFa/0jY50pQQ/TyaCnL0WzY/AbT3Uk=;
        b=xUTxgkx7txX4PEirYoO7rOGCJh52420sLlnuGMcrF5AdJyT0cRQGDpAaSEUSyz3gtg
         R0kGTWydIsVRdDnaRB76EGKr8vXh+w2SKSBSWr+PFzSN4J2XvKYxPKx+hdclaVo/YChK
         eFhWKMIuA3yRjHDxb99f3vru/SNu4TQDyYyuMEQlL0H+cVwN02kGJ2uqJOFT1oaJPrcn
         oNG20Dgx8mbCF5UZ7VBizS4+I+1Guswib9c+bODHSOHDDOB4pQ3sCRsg1bwTU78/Ee4l
         4Vwf4l1+wTmY0k1BmS/k3PwRu/WmwIXT3ZMIYei7H6bcPU6inzdH3SOBE2t3YAQbC+t4
         g3aA==
X-Forwarded-Encrypted: i=1; AJvYcCU0prRkVvY68Myb02aDDVerDAkPNXZPtLf50E8Dqptd8K9XagaJ++Kir4EptKJjsGtuPsL53nkTavCxDrWpTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLb6O0xkB1qNC59XgUeQsQR4Rjh+xne6pawN9DmmcbJm+J82+J
	/WS2v/MG8lDz9QAi5D1pg4gZOsBDklYPbdVfUFE9I98q2J9SLGv/N7W2Gmd8FUVT6PnJens5FY6
	d+1EwgzMRdiQ3MIb4wWq2FOj6Uu/sUPU=
X-Gm-Gg: ASbGncuyxOBUShJFfhC0QCXHON2xwRFkGJbDh8JUpSrl6jNoC8lByFJ1cmczoBqtQnd
	ITj/UnOdEY3MWMRiZqDvlGHbViRsTMq6d3JgWEZokro71sHqguAp4H0tN053Eid5+JT7Bg/ucrz
	58mSnXMIJ21aEnOk9M6oJ6ttjGwkJ6pRperCFqLRQfPc6JS9Af341HPh/xclatoQR2M+tmXoZ9d
	VixcxV9YyDw2qtNmiS33bvL+CO40KGBcRKtw29MPozcEcXpIQbyviqq+dIjupuzEmsJiTKbjFo7
	cXZTNU1RFrM2RCh35+TWmX4xrvhHel06F6UGgRvIoKAKqbHg00ve0c1+HL7xPIKF52UrvWWpGCn
	8wtc=
X-Google-Smtp-Source: AGHT+IFreHdov+uVhNjI+vb4zuqGdoRtHfpLdbPpRiyIyY5EB+5Z0lQXG7LeNg1R8D52vs+phURtS3CNMV6Qy7+3LW0=
X-Received: by 2002:a17:903:22cc:b0:26b:1871:1f70 with SMTP id
 d9443c01a7336-292d3f7212amr26756455ad.5.1761059307987; Tue, 21 Oct 2025
 08:08:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020222722.240473-1-dakr@kernel.org> <20251020222722.240473-2-dakr@kernel.org>
In-Reply-To: <20251020222722.240473-2-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Oct 2025 17:08:14 +0200
X-Gm-Features: AS18NWCCy2kjmOIA6ceL9V6OXhZcSR6v5l_FF-ORfDMjRgq5VddXOb7GOLYgjmY
Message-ID: <CANiq72m_LSbyTOg2b0mvDz4+uN+77gpL8T_yiOqi1vKm+G4FzA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] rust: fs: add file::Offset type alias
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, mmaurer@google.com, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 12:27=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> Add a type alias for file offsets, i.e. bindings::loff_t. Trying to
> avoid using raw bindings types, this seems to be the better alternative
> compared to just using i64.

Would a newtype be too painful?

Note: I didn't actually check if it is a sensible idea, but when I see
an alias I tend to ask myself that so it would be nice to know the
pros/cons (we could ideally mention why in the commit message in cases
like this).

Thanks!

Cheers,
Miguel
