Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675572EB10
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777226224; cv=pass; b=DH87mYWoSCBvEidDhIJmVNNIRS+M1RKrUG+kyUoKL8Tyo1yQEuKZem34ixrX6vjKOkHJnn24vyKbZMqNOChDqwrldSmQPmVuLAxQyownKM/0t4RkzKYB6nWk8+Rx5hSGj0jV3KnsZmzUOoQs1tZcBJV6xuJpKEJaUtm8a+wDoqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777226224; c=relaxed/simple;
	bh=NH5Ca0/+4wXvIc0ULtpzOoFpV1NJR/xYZtYPCbAh5HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olG9Jkg6zhPWHbUx8SFTJVfxDZq0+G5m9zqMoTcLFk1FYX6Mc8Dq03AwJp26NTVNw0tWXWQmsFg08MR9vatqfqXQ6IFxvC24f7ZGcUleif7sRO3LeWT3LhueSOZvX0sA5+2Gp0jMw1j2SNHRQ0378jBDJa5UtfEw3/TRkgnWHxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyJCWko7; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyJCWko7"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2e6b6167d7cso459701eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 10:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777226222; cv=none;
        d=google.com; s=arc-20240605;
        b=U88LD7nrYFVSZbsE04xu348Rv3NrTpLg1lzNj8/y2y3OZ22iCKVO6K59k/5Hr4xnGk
         pNwFlP283KCa5MVEZ0HGhnAvexVOsNkMu2pOdQQxgDuHXvNE87/NnL/EcyFKQHa5/wNW
         6lpWI+ZUod6Qr3Tq/ETKjI/iBlDejUMtM0xWNf422PkA4SqaOlV+ZFU0x9Pzb0uyYGjY
         sK70S7fXDOwLIttHcO+9r4fR7S6RNAfukyLHi3As8NvA/BjQfc9PURGmRFCW5tkKvICY
         VRBmDJcPJj6FBIpG0JPW+pHsVMS8mhMxM+x87IAWL+da1Jn74ERDVMHVgAOJAxmBm+YH
         Agcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NH5Ca0/+4wXvIc0ULtpzOoFpV1NJR/xYZtYPCbAh5HM=;
        fh=VN8ka2LETjv8UbdGfnep53+pweGvabTA62rZa44NcCU=;
        b=PC9F6/JbdKDk4OZnrmFxF6EIsjes6Hrt7cUERp1oGWyB7Kmb0xlSz6ZMXhSWdkjekI
         pb0EJpxgS99wID1RVb5MXqq5KjDBi4N2dDzz05PsRNDt+YlFlyXLviobsLjLxv+4/uxT
         zxb/M1oGU6YQ4QbJC9LTSbhzZJuoXP1HRdhVoTHPw9VKkceO0RIUJi0vNFJ3IXAsQUqV
         nuU8mTeV9Q10TG53KGTBAwYOAvf2VB+AXdmTuxTtIK1I/VN7oB25AElYZP+jZk026jgZ
         Y7O5tE6fGCFtCZ/1Vf7pcoBwLPB4RsROipXyTjJzq6SqdLy3up9eYI6TXnvh8up1O2HV
         in2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777226222; x=1777831022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NH5Ca0/+4wXvIc0ULtpzOoFpV1NJR/xYZtYPCbAh5HM=;
        b=fyJCWko7x1rpRqrEtQCl3FOGARiWq8+++TDuyLfu9iAZczXTf/uo3jYJAsvLnHy1Bh
         l9VS9JBFPaA7ciIbzrCLqeuhEs8T2+YeQTGfVY0t37a3GVEerGjt4vDewvAbeCFSeWnB
         Q8zT41LHpuz2Ge3Xbslp2/ChyfJPc8r4Qb3P1s77wiHa4fTt1dstu27YF/A78aI9N4PA
         bjDeMKYs05kyOZPV6XMz1t9ApQAFkaE61q8NLu/AYhq/42KyqLbRK2TORTaUEVZ6Zj2e
         b0EeeFU9vGfI6Ci+GbtbuuVJmp/wO60UrWtVIEqzFFNPE9/NgL+tQ3zDv8u3dAVV9RJh
         Dwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777226222; x=1777831022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NH5Ca0/+4wXvIc0ULtpzOoFpV1NJR/xYZtYPCbAh5HM=;
        b=lWVWA8wfqWTs6Mp4zZ9CjyXOSZB+ShDEhgYVEahKox+dBWfrWYkHkCtMdiWMWRacas
         JTMcpV6shggsSvDu0oD1MGEFMV1rnDL3yIQsTmbZ6SunHVFaBnWKEglfw8w+72jy0+e+
         YV834QS4jxoht2CPhwDszLUaHO94jz/9qByVDX2+VmzOcCjXi82YMS7fy9BN4UvNWzrQ
         KpMFX8amM8hpBzHEjuVG5xEZ9axfMBA4zn5NqUC4GNvW5bPHspzbNnpLuSGZgY8d6CkT
         z7a1JwMkx5F039g9SV3Hz4VlRce5pAfZg0mvTnRjAiZaP87tw90S+Ogu7DJKlhGA0WJ3
         apMw==
X-Forwarded-Encrypted: i=1; AFNElJ84kofkutSEVBYFpIPmJJeq00zr25P1ghmjtgke29TJgNmJz63rJMm/CGXRDjbFJkYJt/kyRBsfUCLclcEIoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCFMpcZkTcA8qDXmwb0j23uuGYVv1sRoCuWEMqGSsg+ahOb/Yt
	NwJh5kCMXu4Bt5+S5eEo90IlvwuNpKjkRePQOgJqPPzuJUm13MpkN1BdPhLBtFLh2SmBe7XLYyk
	sQY4ad/sA2z4pQSpWeyLKCsMLoL/CpNU=
X-Gm-Gg: AeBDietiRG7y/LuLSqysWNscpYihVE8BaAITjitzZfQuiztVSWJc+CFCT6FQHwq1hTL
	srsGKFL/sTSZg2HQ+lsPTuqkfGyj05KnsMCuIOHara0BmRJIwu7snog92e/3bipEXZJ/DFotwk8
	FXHufIcMJb2MsyFI2bvNRYdNpJTq6b0ZRoa0ClilzibVMreES3oeMAv2mYb8zmAgpYEQFIiAiOC
	ss8hzTKFrR4L/yLu8F6EZ6/QfdMbEt9mMmtu98lQmbifUM1Z/Ez3zg2IXECySHAl68f+ZAioV5i
	+peJVoCuiL/2YOzXUJvVPcRD1jpjpa9nnIIy5Ch/5hBJpEOvK6oOn3gwTSdjyfojCy8WB6m0Gjs
	T2zy2aGk/1BAZWwtM70kH+xDuIN5Iy4AfPQ==
X-Received: by 2002:a05:7300:1351:b0:2d8:7302:d3c with SMTP id
 5a478bee46e88-2e478a2e845mr7971028eec.4.1777226222457; Sun, 26 Apr 2026
 10:57:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260426175317.10171-1-sagartaunk2@gmail.com>
In-Reply-To: <20260426175317.10171-1-sagartaunk2@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Apr 2026 19:56:50 +0200
X-Gm-Features: AVHnY4If1kUhnbPtdCjXPwJsCndzaVYnNn86BhTWC14Y0K6aWqOuzjU2VdrbCts
Message-ID: <CANiq72n2eoHnU++GyXRb0bbXXXU_3W=yjkJ0Yi54O2Q1oprNOg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: workqueue: fix SAFETY comment Arc refs in Pin<KBox<T>>
To: Sagar Taunk <sagartaunk2@gmail.com>
Cc: ojeda@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, gary@garyguo.net, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, contact@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 7:53=E2=80=AFPM Sagar Taunk <sagartaunk2@gmail.com>=
 wrote:
>
> The `WorkItemPointer` implementation for `Pin<KBox<T>>` contained SAFETY
> comments that incorrectly referenced `Arc::into_raw` instead of
> `KBox::into_raw`. This implementation uses `KBox`, not `Arc`, so update
> the comments to accurately reflect the actual ownership transfer.
>
> Fixes: 8373147ce496 ("rust: treewide: switch to our kernel `Box` type")
> Cc: stable@vger.kernel.org
> Suggested-by: Onur =C3=96zkan <contact@onurozkan.dev>
> Link: https://github.com/Rust-for-Linux/linux/issues/1233
> Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>

I should have mentioned that, in the case of making it a fix, one
usually uses Reported-by: and Closes: instead of Suggested-by: and
Link:

No need for v3 for that I would say -- the maintainers may fix this on appl=
y :)

Thanks!

Cheers,
Miguel
