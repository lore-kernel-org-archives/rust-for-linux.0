Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793705880;
	b=J7G+w/S43NXWSAMiugmg5OiHAAwxLLPfKwDf43kREqmo1aUfwQy14lBmhuU/nG452SpC
	 tiI/nYXA7Coo8C7yc9lYmXrhoNhrHtFPsDlV7pN6Ag8B5Imu68oasaDjstgxqDYkaTol0
	 uQqvSki2cSTXqRGjPj1OqFpqwFSlI4v7hvOYtO/hqruG3CBvyXUoWzD3G/15+ufLgGgqD
	 r/TgUtIHanaXgOvGfPUyDQs6pmDnKlJsRDo5kzisdq+G7JK2F6wBstSTfVx9WBsxhoAEg
	 aHuoqXrzLETHu+yBy7okt7wYkwjIwYGa4sNtJZo1giarp5Ffe7uMD8dWEpM4heViDiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ox9VPdNe/5nvNwvY5JemNTpyw3tSN5sVHQ5SBOK6/8M=;
	b=hEfaqiqzJDv48/y3yc7asO9vh1ramvSkWQ58ElG4GgMFcQVOun4iPDXEqXBDBPRRlpzo
	 UNEo8DCHIdLgXP3ECWsjr10UT1ixAdX81u+D2zcYbBYyE/snJ5wbB1BVaCdrFkzts3xf9
	 rZVe9xP4g+PbNwTt/rE6wmwMLHDTpQCnmDz5TcpByC9TLxcVubhzNShtl8U6NbAko2tOI
	 yt4+c/ELrsgtY4zk8/Ko8ZLJ/T3Kzg1PuIw9kvrypWWeFwaQP6K8SdkjdM+KRdUDg+L1v
	 SzeAGShJdbWAYrNLIWEQXXLOECkenDvWX6wSstrGPgb5yFK3obLSxiMrZXPXcUgoYYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WP3UI+8B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096B3606A334
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 11:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 096B3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WP3UI+8B
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e8c028eefeso6240975ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 03:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793705879; cv=none;
        d=google.com; s=arc-20260327;
        b=K6/UNHuTRqHz7wRxPEvtiD+AoZ/UE7pwwyLbXHTXUas54kEqkazAWoeX6gH+VhrhCD
         NFGE3g0f4Tty0mOF3Cpk5eHrMOnEESXkWKPq3pTWOLk8bX3mK5tDpomonN4saal5udJP
         UMwUzkZOqyflFAeEMMHACoFo4AUvl/Yj2LRT42fAJ62ZVaVGVU+Vey0xru9iCNwwloUV
         YkQedZTJ7qGviznGCUZ09Mp0r4J7NcWTSY66p1NNQabMEx0PUG3M4wA8snoTINgMqnwr
         T23rqyKsmk4Kueg7dTu/+IB7o/hP+eycRh/CAFO1zId37YAhG6Unop6CclJypdC3wmBC
         9+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ox9VPdNe/5nvNwvY5JemNTpyw3tSN5sVHQ5SBOK6/8M=;
        fh=6YVBP9PIG/fEnOlqQdjs78VnnJ7drqKRu+tAFiRODRM=;
        b=XpSV50P6//4TZd7L1e7BKKyQpEgPWl0+coG2zFXGcDU4p8Ce6qRnN0SpxIlPSpo/jY
         nLzYthIL1xifgCVBuF78rZ2QdaMWcVySTMGFsuUzfdeH0Pr+AF6AoPFAv0Ma66LHdLa1
         /5CCZuaSemSk+5EMOkPx2SPyQoInn0KcOhZzHEZkdJgXkWSx/IXjDW+StRYVja68yQ97
         R/oyge6tGkW21dpOLc6iJH/2gPkgVpkC59voL/jApNRalMyOhiyweLeK5d09iuTaAfz5
         xMkQM950LjxyZ/hr45DDyeR40pjxkntUI5DkjhxpuJykNEgaQZSd/ed+T+uKI3uLtOp1
         gyUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793705879; x=1794310679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ox9VPdNe/5nvNwvY5JemNTpyw3tSN5sVHQ5SBOK6/8M=;
        b=WP3UI+8BsHGl9aTBu+w7LEFUJBnmtfgg7/jdcLdhAXj4N1YI75wsuI6+fX8Gg+ocSD
         lPBTpkVa90LCDn4Pgr5wL9teswpO6rgGZCgFB35Nauvxr1A2/TbRCnPHMZ4CBlgmaWh0
         OJudTryF9ZKukrDWGaoCiMFm+S7WTXXGqATVk5Y3O7aYSYK9M+R6/el7uJrKKM7kyeQN
         8Vm4JZby8127WQCNQUs8cfK7f7nTnw2Y/3Rz0Y9Y1NMF/DsNqOQPbDPQDRu99AaPQCRu
         aDABgWeAoMrkmXFdvx7QBvbEKOoIleyQ7eJxubf1TWy0/eg1X5R1w8S/LtkcdD0QpSyG
         prXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705879; x=1794310679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ox9VPdNe/5nvNwvY5JemNTpyw3tSN5sVHQ5SBOK6/8M=;
        b=XSjt5FIYXvjWBHGXHGFpXnIpT+hLBxapmnjmT2TJMlAYvEnWcD/Zz6HGBU28X7chY3
         spMd+a9kQ4bslpQPiXCMiAJkbPGxyU3Ik+RpMoTte5lo5uEjkvcZJlxp0efPeYjvCBgm
         O5Nv/RuMxNaPDkJw2xhgjsQ8ny1bnPhjPpIy9jlr3KM2dZh4l2NIkYhBAXudcg5U4OfB
         IPl56O7nZD/9/Go/eNTHTPUBMR1X5I722K++te14j6jdmWJbZGG7qMpRbhTC5mAhneqo
         ZSyYdzzy084ADV4crTroDg+B9ncKcJ94VR0vxQQ31rDQ+g0Vr4qSkgN/a/BoeNWy8s/h
         lZCg==
X-Forwarded-Encrypted: i=1; AKwUvBxU4T46GfG9Bma3m0YEk+qi8/5p51/gRzAKGqU53z7Ahjs1CDUlDQQsl1FstM+ec3Jb3fQnkG8iFEBvXLJo/Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z849QC1tO2oS2gimdHvsFmdUX+XxeCGp3NNnp81Pa0aVQkdUJGU
	/SS4TOtFj6XJVbWyzkUoGXBbCtmiJ/JJoJxlAjlfsZStUL49Jr4RZ9cIWzG1uB5Pb9Lqq8FoFuv
	3LNKCqUlT8FZBaBCJQXlj2Er4vCGmKFg=
X-Gm-Gg: AYBFou2e2nXLByE7Fj/t82/jT6ZLiGI/ujEYTrIe8BcPZ0AbBazdxX/OHzA59TQNhcQ
	0l+MLtQqPKaA0WrMbs5goW3WDUZ+2Hi8zXAeO9Y79EfBAG/8IR8UCntwUVGx90wA1nmAP9h96o6
	HpVszuLBAKwP6RlvIUrEwZPMaymS336SASAVINKnaT2E7YsG0yKP8cKh+OHI4kCQ5/HFDZEYlGX
	+QPlnlacg3KtV5mc7hJWS/+hAnN5VSmfxMNs9GBqrGwuplrwIKjTR42EgjIMRAccINruz1OuKEJ
	JfS6GfVMOGK5ZvcK34ADktRHBCmONj4Rd6a7DceZdvNlmbKeQclicUiuIigWIv9RCVBrQPzHAQY
	91eTCKPxrHoQxCGI6AZXOaoCkkMQD+vBlGZ4KMXHoJvRIJqkvFsHCKJC+evhdKh35eMzoyjX5rx
	/mIcozD8Cc7dyP8d11XMW5WhsG84I2c4omSVYq8wyiNeKact8cCZt2aTeCH6G5c6wyddbUSfHya
	kQn674dtgEIvRRmT/JwxNGYRPSwUUEkoVEp
X-Received: by 2002:a17:902:d501:b0:2e9:6468:1ff1 with SMTP id
 d9443c01a7336-2eb3648bf2cmr192226705ad.2.1793705879368; Tue, 03 Nov 2026
 03:37:59 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKHwh-E_A7Bp1oP5PYkgE62hh0cJMQRuxOM6yXGF7OB1QR0BhQ@mail.gmail.com>
In-Reply-To: <CAKHwh-E_A7Bp1oP5PYkgE62hh0cJMQRuxOM6yXGF7OB1QR0BhQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 12:37:45 +0100
X-Gm-Features: AclHuK_NW8SW_bjub3r4YsgwDQ-uRt3rX5_H7c3gsxcyLDfpG0dMRGLtAyOVWec
Message-ID: <CANiq72nNFLKhywoDPRmkeJSwkhQACaZeB2SiokowTOE6a6rOBw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: alloc: test drop behavior of Vec::drain_all
To: Peder Bergan <peder.bergan@gmail.com>
Cc: dakr@kernel.org, aliceryhl@google.com, ljs@kernel.org, vbabka@kernel.org, 
	liam@infradead.org, urezki@gmail.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 11:38=E2=80=AFAM Peder Bergan <peder.bergan@gmail.co=
m> wrote:
>
> v2: Split a long test comment to avoid mail transport line wrapping.

No, we don't change diffs just to work around wrapping or sending issues.

Instead, please use `git send-email` and `b4` so that you can send the
patches properly.

I see you used `base-commit` in v2, so my v1 was outdated already --
that was quick, I guess you may be using the LLM to send them and it
decided to add it after it tried to apply the v1 to double-check or
similar? :)

I hope that helps!

Cheers,
Miguel
