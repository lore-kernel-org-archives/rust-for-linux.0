Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5BE20C463
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771506658; cv=pass; b=UD58N0UAPFmIv5JiXSjlJ9k7cCv77CFwbxk3XVka9wy/rFRQeOeONRFkVFQUNMSPrJDcYo3z8xc93J5Nl5hgWIFVnEV1GcXkUtE5Q8QC6tZTYTyanh2DFUh2Km/0qIE31c4urmaUUry7qtn8U27ECqwq94OYmVCD67CZogWX5RU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771506658; c=relaxed/simple;
	bh=ryqlh3qcM3SZH9ZnjPtGckKVmstIL66swQn3dj+HkmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gw9NmCN89x2Wozn9ryRs57M8OZco4RDtKf1DNbEEsdEtlMcAo3IDE84Dvt1XB9lS4eHIX0kY9Kyq6is1eKd/p0rWqujSnJ/AMFHPzW7iGAdcenNOqezRwBhjBEWEalof+u9nnqrTx21bC4INT8adaUzeWCScaC2SHGAcFjmtpTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUBzyVry; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUBzyVry"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-124a55b7bfbso34783c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 05:10:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771506656; cv=none;
        d=google.com; s=arc-20240605;
        b=HpdGGQ3NMUnFVi8evaKXsUsSVjkYWf8qxPcxOBVWD9rVRkZGAeyvpWgNrKmlRpA6MB
         vRI5wc29G7m1qRvG176/q64ih8sJmUalZ5nMAqss65Ef3A991UeaQ1f6YYjIicFFL/v8
         eFz0dHhHeO1bwvym2IttK6t2HYrlUXF/ZGiPzvj1rC+tkCcsrckYgbucUsv/KUxEdoN7
         AURNsp7D/C+01apjTMEtqfPprlPPlheK1v7U3J0wt0qNHQuQmEwFDN4ld5DQABZd5X/j
         s0FU9mwzCayCJNRuZzAzvBRFCop82AfnEjPY9dIsqMN0kE9KXkuBktCPYDiA8k6cdSBk
         kwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bNQ2PqGhooUAWw+4WeR3X/KIIbF6zTkLe+pW3PYwhxg=;
        fh=KCmo/s149VViGta9XRvNbBPjl4dsT1OND3+fsxtABNM=;
        b=Gz9TpJ8V/yArQpntnmAhJKsHg3INFJKRGlBEVeR9nlEEV2gAzh1HuDsspRGq0xLEUU
         gBrYArgothEj0z84c3Ydl9GADT+KzCJxpGwm+XjngD13yITtPtZF5gcHdSNreh502bXp
         qk46u0aqKQCMezfIlEFNMqtHu8cJUF13+1qyQvDIy09ZHFViqv8H7fZ6kcMDAJDNupxj
         uSFHHaaObpSBc+NPNIh7qZbtYoeNKzbX9jEdNxeLzgLgo3Ahglbq36BiSqtkrhAzzbGy
         lDmyYoZplIgQVgZ5O8W50n+4IJPbGgyvKSvB8iKiyKTqp1Q8vjweYBjk3NtM2oN2eWoc
         5Ycw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771506656; x=1772111456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNQ2PqGhooUAWw+4WeR3X/KIIbF6zTkLe+pW3PYwhxg=;
        b=MUBzyVryzyerUsLvSCSWXK4zgy7j/5gTVSe1OhdUq3TSUvlkoY86SPaQrGDiwoS4iI
         VcjWxblAanMPv5YZx1xCuQGYNyrYFBdIP+wPgqT4pOyn7GRs3PXjWJXcufouZd/NyGDV
         KhRcSHrhoo6d4m+n/Ts1ZvuYNiM/9plVPpxn/W6ALMeKjUZx00YylfVVbePWXf+KkW7N
         LMpCZvQtCTT3Avne89pCL+FaS6Ot5q9pfTDGksC4NDlv+ehBd8ypDJ2i0zwVSV9IvxM+
         6JwCeHriTLAIgQkiwZQKhlWWUdnyaOQb89Kb5vfuRkYk6LJ9myequQ5aX2+qYbX2Ht32
         rqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771506656; x=1772111456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bNQ2PqGhooUAWw+4WeR3X/KIIbF6zTkLe+pW3PYwhxg=;
        b=VlrGKB0qufAJQSJkgZd3FZrzAElcrPUHWNH5BvTGncHHYW2yaULRaE6ndpIGoBrO9P
         JcEUR+2EzrATwuYi3LUbg8UN5QfHNodxIUKtemlLRVrLGKYB8mx+XRAjBarQWMS5V447
         qjHBibusdE28U/1hir888Ns9fMbmKej0T3cJnU0Q1XvSlrjuU0VUVNlOnjw06PB73gaR
         unU40KRTFENDA/oKEbO0YB68NKTK/E/eA1O64VctQUHALjjwAfzn/relI36Wt00ULHAF
         wzUPkNcd9+ishoYEWq2c+6djxY5yk0LTrdxFQysrrf7U1mhzh2/+mcp84/QxFqnrPZU2
         axGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7ozmCPO8gDrReHfIkCEdUm+VCFDmDH0kYp4XY01NNLDQDNPP2EM+hoJ3MojSTPYzf94XEzRdJr1l+b9uWsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrB+eU0N9yqGeWtlykW2FIuXmMdKO9IsKCwN1rTCwlqgarDxk3
	PYUngRqLVrnQeTwaY/u45dej7ddyt4AJqL4h2kkGAXAeVOIHVcUxzzdBmngnvy2k3xK0G41L2NH
	Vib8he3lVXog45bjtfOx/YOvNlzBY8q4=
X-Gm-Gg: AZuq6aLYkBK3HDxBIVGs0CyaxBq1tiXzjgmV9ib27dkVtkLvD+2tcRQw4m7BVNCPWhA
	ZMqRPbovlJBQEiPI4cZ/fRuctlw3MlB/JBQUOC+n4ceYJASUqG5Yg40JYFfF9xCVMkwT+e0T52n
	yjM77VvHl2RsT8Xvmx3Q106NLOfTokUStEOf14y2EdFCydSMC4/iVLBjWIL9ypF6F8MsStC57Q3
	mb2L/kOURH9DLhHoo16oWD8Gm5roRWRSlpuMbPwJX6qoOGoMG8glMEPjdymDZRNi90OgfTttS05
	fInTliHGXPc9ZCoOef3+hGl+1txH99q0KV3CtK3Riluk4IFY5FRxh3pJH2bINESRWHZYaL8hkuA
	Y0iu2zMMyl4Qu7anl/sQ4v4oX
X-Received: by 2002:a05:7300:2327:b0:2b8:2082:5bc5 with SMTP id
 5a478bee46e88-2baba0da25fmr5350837eec.5.1771506656098; Thu, 19 Feb 2026
 05:10:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-atomic-sub-v2-0-8bd99cadf26d@kernel.org> <20260219-atomic-sub-v2-2-8bd99cadf26d@kernel.org>
In-Reply-To: <20260219-atomic-sub-v2-2-8bd99cadf26d@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 14:10:42 +0100
X-Gm-Features: AaiRm52uPelyCebZtFunJmyrgr5zGfjpm1gcACnEBJNW1DOX93Zmv07WRcnUB7A
Message-ID: <CANiq72mqjZZ2KAYREYxEp0x58qBpoF5fbShavTi5bea7xj_PhA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: atomic: update documentation for `fetch_add`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 1:20=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> +    /// assert_eq!(54, x.load(Relaxed));
>      ///
> -    /// assert_eq!(54, { x.fetch_add(12, Full); x.load(Relaxed) } );
>      /// ```

Doesn't this leave an empty line at the end of the example?

Cheers,
Miguel
