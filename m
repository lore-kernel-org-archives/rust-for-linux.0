Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A719430EF6A
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512758; cv=pass; b=LG7B4mrzTsnEwxrKSveccQjfpnTD1Atz8pUa7YQ0s9ccjR8sLq7c+e1iDN2KVWFEv3dk1Nn1/q1xANMiqwlBuKa6YCqK0VkHamWJ2lHUqwRHNuXHujT0veI/rLjdmNs++e5aItcIQ7kAulE33sjyASNjs65kW+ktInzMX/PUdsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512758; c=relaxed/simple;
	bh=6dxH0njHff/R+3+6XL2+YRmdabDmRoEWRihE/M8x6HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OTi/CF1OqDp1cANCqNUSMXI4GUthCLxtn4yRT+8Nbedyna6pdCh4CcmTZhX2o/PDNjblzmoY2nO/gm2ResXOBe0NDzBJuXJ1f37ZeBktb0RBGjeG1+PClYFYkHlEw3fsYCDCLEJXmPlOQXbSPwkksmLgSZ9Sentmc4Jag5iGIlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1YYcgSw; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1YYcgSw"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b72b154883so188448eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 03:19:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769512757; cv=none;
        d=google.com; s=arc-20240605;
        b=D6SSbPFKQ3U/WIWC3eMX3jZ78m5bae5ym+V4sKLY9UpUGYzmGNhw9Y22ahWVxq09oZ
         /PQup/tBiqmYbbwwnl8ZVwttB1gVKe/3OngHpj/IotkPXojwgetmHTzuFoN9Hw7j5iNj
         NX5mDRTIpCPWTZtrEXkMUz7HVuxeOCphhiMpdYXletocl6VzPtFtXEEdUviWQGq5+kN3
         pjWlqQUbPz+b90ngBCy+4CyC23c8kRAJKxfDir2FONRGTFxSvJaw5RAcS3xEyYTOvGnA
         CmK7XkCQEZyjJmfFG1O3M32WG1tYt30KwqroBwNR16uvQwpq4shxgSlOzl6rhW8DQ9AG
         mwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6dxH0njHff/R+3+6XL2+YRmdabDmRoEWRihE/M8x6HE=;
        fh=3BMp29QnQiyyscujvn556ItDqj9uYIXMwAs+kHrQdlI=;
        b=cFbSPrnWSF4ZEiVRBcDpNIySXbpSmQsBRiG5WBZyv9o0og1s16lniSP3lq+jNdQrhZ
         K5G8a24Wi90VdJdLtdcJykQAiHxahfLZX3md6746W71bZI7jXoqhW+u8jay+YdnUfCQ8
         nl/mpMJl1KRLbiizjh4RbpIEHkP9KLj0AnTHCyZlxO9yQ+IFjIt+Mf4i1aG2ypGqZ++7
         7WHwEAnUE0SPfGw/jUP7yBKmZuL7Vy0Jr6RbjirChKOUDIr33XazJi8I9xg4H79tM5z3
         clCksWlNbKTanklo40scYUhHEsymz65j2FDImurrBNNyat0Q7ba+TRXQyJalNI2BFVWl
         yzlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769512757; x=1770117557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dxH0njHff/R+3+6XL2+YRmdabDmRoEWRihE/M8x6HE=;
        b=d1YYcgSw35W3MqEehC390olKQyRh38VAXQvbYLmzaYOF0EhIMukphBcJcoxdRBpFLj
         OgW8Ea6qKsT4Lhr8uokNE96glG4IcVc3XtcD08Ab/77EH5JZarLjD2FwFl/HVj/M/0Gr
         RkPU43GzEUNF/ZpVtG6aT57+paFzXbaSdD1dqWC6CP/nzDT1ogdmf66w/7TbX/TrbrAo
         3T/CgUwPvONEzwT1BY6WqN8ZYX5iOAidsWGUhZoAZl7MhOVKGknc0vasnFMbtribIkmi
         OdA12ayxedvlbBIaYuB+TgnckSQ+4bs5x+4rQ7wYKn2DfQZrNPi89j7KX8y+Ul7dIz4o
         JjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769512757; x=1770117557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6dxH0njHff/R+3+6XL2+YRmdabDmRoEWRihE/M8x6HE=;
        b=ME7VUqBbu2qSJUtfbGZ14Ux3xfJ6vBgl0ZPqjUHIwlqOaaZt2VA4TRhmAWioAWlne/
         5x7U7+P2eIntVyZFn6xrSnyt17MZjlDlMt6q44MtlgmXF/db4EYv7qCbjDr4hs4+Y6dO
         DbR4dHeif6zbt84ZuZMvm6HVgTKtuQsy4EnihK5B7crrwl2Xh4xw8AN5sSIBtqKIRPs7
         ENN59x+t8JyCtXt2Tz8ePU3BZqYCE+tUXju/nn/i3Q6PlEQ4+fy4/hJPGiFZduNNy6dv
         uyMlGCzfWW9VlQ/WB0Pdq6KjqtqtAKly7kysxajhGv+xJzsiKyHeSkQNQoWXbeFJMuJx
         m0kA==
X-Forwarded-Encrypted: i=1; AJvYcCVK4WGIFmu9JBFOrXbCyEOhmDd3HJhucFaTDzorO+aUw+ypuxzw/v0tXBozMC+KXhhgfrZgD8jkUeRN29qDOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvSEKBQo2W6EF6h8Pur2BzxIGTnZ/Y6fe1gMagtjDqqYN7U7qO
	IhTbeB72X8shvFLRPLoKtSq/JnJasSKmx8gWKrmZTuZfl0jzOK4s04ohdnKYDIpmLk7r3M9y11d
	BEX+hg1OiMVwickV0cDqzFRy8lul1Bzn2UYHJ
X-Gm-Gg: AZuq6aK21tpeGwpf3QuJxBCi4hTmJaEIBeGSfGkJ0xaK2jLPeKTa0mdkoQ9rf++dyQO
	n/oLGh8iW6EzSTK2KijDXxZNMtEL7mFOcCVXwDpTTiaSoH1lfRPFCfCDt74ruxhSQ9G+dQKwe5c
	OPMS9b9j4qikCkqmerd4YBwEkalXlmVj1JchGYfSqr+ApR9rf5TovT5E8I/ACQ920wCDrVWR9gF
	Drr7NGFXkjEwwipNgar4APhYyxN+8BgTXor96qOc+sNkcAZcjvxS0Lob5fy+aH0QDfaPpojDW/e
	LQ+LkxIVc3Pb2krkABxv6DY03RsyPD/RTBKFnz7aibx2Hi3/Ui0XoR/AE0mrh4/jLQeeGn6trYg
	q+JcYAdgYXVeS
X-Received: by 2002:a05:7301:4341:b0:2b7:24fc:f639 with SMTP id
 5a478bee46e88-2b78d9042a7mr405917eec.3.1769512755106; Tue, 27 Jan 2026
 03:19:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-tamird-kernel-org-v1-1-b390d329b0b9@kernel.org>
In-Reply-To: <20260126-tamird-kernel-org-v1-1-b390d329b0b9@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 12:19:02 +0100
X-Gm-Features: AZwV_QhUe0lkJYMhg84xVkyGeJ7q0-yL5Xgn7WagzZahhsOcGnjHPMD64Hu3YN0
Message-ID: <CANiq72mX7fozY3Jpt8uy6Wf1ZmbuV=xHF7gfape5N1VaEdxGCQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: mailmap: update Tamir Duberstein's email address
To: Tamir Duberstein <tamird@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 3:46=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Update Tamir Duberstein's email address to `@kernel.org`.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Applied to `rust-next` -- thanks!

(I wondered if the prefix is right, i.e. if a comma should be used
instead, since I guess it can be seen as two independent updates, but
it was more common to use this pattern, and I guess one can see it as
"updating the mailmap-related concepts of `MAINTAINERS`", so I left it
as-is)

Cheers,
Miguel
