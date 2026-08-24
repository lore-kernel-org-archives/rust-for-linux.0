Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE26940DB4E
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571567; cv=pass; b=dU9h0Fy2Y0lYcJZzmEvaNsdYRjTc+wYEfxi2zEiy+ibFgKvJdJZxddQQzfHss2g1dd7Laz2bNwVmX6a+q46xYBiwYzYVsst3LdNf0g8Ztqipill7C4BdDeTTaVprmigEERMewF7nda9h8+snxcNZYHNmpomSA+CLMoeyO5lij08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571567; c=relaxed/simple;
	bh=IyHVcCjbrLsnikGSohgZ0HEcX226iRTLlWG+U7qEqvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oIfLmFZa0Trw4O5SWKIi6Lqh/bpcY6+Ej75AKGRwsXD71ixW3uVqcWrEQ04dm9AwXcJ4GpW6TrvG5CnlLUwK/Zo/8Y1KDoEATjwTnND/iQAzx/RDFMA8Mcx4zQ/MZotV3rJt8N5ATR2YhJVetKIs3u/KUhN0k9uiJU/HxW34ieY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9rTIKCb; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9rTIKCb"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ceeee8c46bso7188985ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 04:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787571565; cv=none;
        d=google.com; s=arc-20260327;
        b=GgItgc8nahdslS2f8763tSGLJzbdvElvmH6hMycFcLmAqfNiVXc+68eqBWTGjSD49j
         oncFv82JIBsH8V9vETAVqt/TK7TqIVqnzGI/s8pa1r73beoua8qVKd4P2azITIZNDVb+
         0+hA4aGBpFsX3a3CReXFtIIq8obUn5MuLzUi3XD9EBwFmrIBA7wnTJkY7RjZceVCzZTi
         OUes2O1w91iHc0/Q+zekTOAj0A/VdWFvJs0b7mcVFnzTNYjkT0iC6Z037CwUR8H2on6J
         VKNedByisYNCon/8iCZrD21m8uqdfkOxPSd+6e6scsWe6wWK47/P0wwnFGPXVJmviFyT
         ItCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IyHVcCjbrLsnikGSohgZ0HEcX226iRTLlWG+U7qEqvg=;
        fh=T8gyybTVQxFRtlBlPk2DpQq8w04HHN9x6kXacugAe6k=;
        b=G93XceQ3dhQI8W3vNiJNeRaVgX3CxSombd8WxNZ2E+0YTL4pL4KZbo67oHl+fsa3rr
         K0cbwwLaTRHziRciGTnlqpodz7g7C2G7eDO0ufCVfdAWsk7c2cOm44hf//1klWpsoJkH
         antQdWHK9sdlWEd4koExikDosckMGzQtm885uqX9zC/vk0IUFZ8zmfSFUss2tw3DRIlD
         7RVsZ+T8vSjlFMf+Ganfv7fM0E4rMoLEoA0hc8pv8eHji5l/RzvUIoSBr124yzbcqDMD
         awExfvt2npjDozN/88WgeCatdiGpoymPz9C2r4HQbG2RnH/wLBXxOeqtYPRpy1e3sPK2
         2DxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787571565; x=1788176365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IyHVcCjbrLsnikGSohgZ0HEcX226iRTLlWG+U7qEqvg=;
        b=E9rTIKCbiUja8Rm2ds9mmHC6jiJmoLXzhHNYSY9fKwC5g3aRjhjgMIWxtn7h5mtSSB
         7u/O+yPrlJatNt7z9Vs0wPLACBxR1vUMWf04AXN3GM5Smk8oiw8IMz4r5CNiDf56sBdG
         2UTgOMXih+MvJffWJ6rpVokQRVDk/C13WCKS75gY9P5s7sY3VwJTHzUUbaLtQQEQvpEh
         OnYDcxT9xPl7Dn8yXyaYpqVmeHzymUSClV6xksSPzCIlvEpBMS19olb45fqrGdvvlwJY
         JvWGf/8enAqjCofCbsYtdZEezgmtUi/fPa3biGUUOu9QB2szjBuCFkkKqlUZrGn9kH4T
         w7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787571565; x=1788176365;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyHVcCjbrLsnikGSohgZ0HEcX226iRTLlWG+U7qEqvg=;
        b=iCQVIiza4pS1M2JBEits/MbBk+gS78bmRosdrz5a5iVTf/mitD2p6Fv2qhm4kDw7eN
         VPkH66NJcv48IuMKsa/8t/yhnrIXUbmxvOCYSXMK7ja2tuUf6QZwBoD6k2h3d+tB2O6p
         4TVa9BwbLdWOMOeYPNUjIeGAEmmIxELjiRGc3sGzvQ8y7Cds7OisPzCy6DQWoA6birdR
         ZpwD2vTgGpAS2QPItDFSot0c2ccESHAfo9GwpguC+x8xG8Kv0DYhVIGWF8V/ke0uA/2g
         i//cUKz+OHFWQxvBKRjyBhzaXX5uybucVG3o363dLJqlWzLb0WXweFiBw5yDojDiGF8a
         nCIw==
X-Gm-Message-State: AFuF++lrz0eNGkPeQADS7xKhIudqEvww28v4Z84UidHBeUQJDw7QT+1r
	ygJ4XOkmuordh5Cj1b3DZpmpm6RvLVEAqLQ1pgATAFZAv1S7cP50SvLGoXUOaGA35jsVBCtM7KA
	XuNGZPWYJatmE+YEdSHoFZi9OMY3hbH8=
X-Gm-Gg: AR+sD10oUDMMwnVzg2mNC52perMXTeFtIdxaKQE0sCqJUhGlN5nR9eN9bQlerh/KGp3
	iEZ01XB6zDJMii7wBu189J0CHgmi5xfzXRYydOchavdoKscE74jye0lVamza4Adgqe7tizlcCdp
	Dd7B//pd12FDNnw5rxxMBagZsj1PWIOMR6ce24d7fOxGOAobQgPwLzu/m8u55Gzh3JrqPM2YCps
	69vyOmV7jTuOJtuEENk2OBfoHomsm1Ch9kIdM89SI931UD/ALqr5SDh9B2FOIielZkv67nVYPcu
	Y+wbF/N8iwYyGyinWYmlY4pORH18sboHEFMasaLYVHuuBAgosCrgi5IgWUr9tnElTbgqjVtQP8h
	ydIITfATGtomlyfv5Jf8jOhm9aXcqnyOM4nTwI+f2C9S8SY7QudUr3VK7mZD5SA==
X-Received: by 2002:a17:902:f709:b0:2c9:d298:6c0a with SMTP id
 d9443c01a7336-2d64b047823mr241046625ad.2.1787571565146; Mon, 24 Aug 2026
 04:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824111227.742645-1-springbreeze@stu.pku.edu.cn>
In-Reply-To: <20260824111227.742645-1-springbreeze@stu.pku.edu.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 13:39:10 +0200
X-Gm-Features: AcwNN1V9wg3yKVAh9_mN_zlYKlheXes7kkLSKf2mSnLOgXogC2B09BSq1Bgm5ns
Message-ID: <CANiq72nArSN90SWmPiKxYvnQUxuebJ-W8OiYqXmq2SZEfJnGGg@mail.gmail.com>
Subject: Re: [PATCH net v2] rust: net: phy: fix off-by-one bit positions in
 device status accessors
To: Chunfeng Song <springbreeze@stu.pku.edu.cn>
Cc: rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, 
	fujita.tomonori@gmail.com, ojeda@kernel.org, boqun@kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 1:12=E2=80=AFPM Chunfeng Song
<springbreeze@stu.pku.edu.cn> wrote:
>
> Link: https://lore.kernel.org/netdev/20231123050412.1012252-1-fujita.tomo=
nori@gmail.com/ # v8 cover letter
> Link: https://lore.kernel.org/rust-for-linux/20260823103644.342849-1-spri=
ngbreeze@stu.pku.edu.cn/ # v1

Not sure why the cover letter is linked (if there is a good reason,
please keep it), but at least for the second line above: we don't
usually link to previous versions within the commit message unless
there is a good reason.

i.e. if it is just for changelog purposes (which is good!), then it
should be placed alongside the changelog between versions after the
`---` line.

I hope that clarifies!

Cheers,
Miguel
