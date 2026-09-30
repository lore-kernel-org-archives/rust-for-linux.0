Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A7F4BA1E8
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 12:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770442; cv=pass; b=QFdorJvc0vg/1l92GXyHJmPD7LOXxiCfEgaxJ7d5DbpbdJ9tKHZWGnNQavpA+O6Ed5+kQXtdUmlIM0lJtJm/PjnI3ngSW0dbqFBP+Xgb9WVcBpEtkGSQ7PouFQZ+IQJ3HEJgxUSzfBcYlP9fCWdp60lNbv5aNDHbz8LsDZZspL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770442; c=relaxed/simple;
	bh=2n4+UnejlqYn1u6OpHJx7OaKBKukorY5gDQh8E11BEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NI2VWAXrktt1ArNXhje0275OTOErwYpppGKjxdhAkY8c/ePxMKuHOMKgc3WMJ1yoDUmJwaD57aFrpOLqyZQ/hxa/+MG6WpM+EDme/4XcLEB61jGOrjIX7MgsydMQp+vgOGR69UbTQpPlRuoewt7swLLphEjT8FnYFGqzG6/q8ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lr6HBdvp; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lr6HBdvp"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-14b1b157591so49979c88.3
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 05:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790770439; cv=none;
        d=google.com; s=arc-20260327;
        b=BSa4A9H1H9KTn7L6N0I42oQW8aasIL+TVTvP5RqxzYvyj2WOL533roXDQZYpbxOWV2
         w3eijteEYROYTjxhX489PPJaWri8HYmeAeqAiNQw2EkWgUabOYWbwndpbRlsboD0q58A
         YolA2grt+qSx+ssp/al+cqoNpbiIEZtbNjivPqcNiDACJp80MJCANes47/54LX6DHMow
         ZJq7Ali5cja2wu//dUx/JKN2Ny1PNPgMqIzGduOixQeS8CqFOqvkpnjzBZ7xnQBAXZg1
         +0QgY5LagzdC8JtW4QAaXRKVNos4Zzwh7cEddvpIrOUSyWFx3dO0qBmHc7pza87avfTg
         jKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2n4+UnejlqYn1u6OpHJx7OaKBKukorY5gDQh8E11BEI=;
        fh=N2P1H1fa34QyYOuQt9Bgv7BO0CTAEjvGzHHH5sdewdE=;
        b=pOrvH7Zcss9fLfPnVETUYRYhkNy3ql8M+LGIrHtVJlodk60oAqTUPfoMYNn+AVxVSg
         wp5TvhB6cDtHCbk8JltUDFCGsOaERQBBo2rAtkzkM9oBxaUqpa22BpEnF2jHVbEJqXZc
         WN5jikaT6+0bJCsJZ8pOZCTZ576eAQLxQJBlLWw0VfHezAszeJgtHH2D5FZE8yl4My+5
         NoMZFDWOneeM1rYo1zrOUk6B5oVUMs2K5/OGjMmWg9RJPLIA6EiTqrLUohLnRUbyUcig
         uf3IHCeBBLXx2jTa3vLXIn3QwD0Ms6qVSI+xC+3eXl3h0viLcVti/5u91ZvC5+z7kDTg
         gC5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790770439; x=1791375239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2n4+UnejlqYn1u6OpHJx7OaKBKukorY5gDQh8E11BEI=;
        b=Lr6HBdvpcK5gG3UJ90OoWJqwkSP6ZlqHmdnYLL+cfa8QgrsMSWUTgBdya7bqYL/BE+
         TL0+0tKyL7s/C09bRHjxMhn4KGCtk0j/3MsLAuW2KD+imYKJTOYHBJPsFPje1/U/7fnj
         wTP9ARh4w1acgjLpMKbpP809VU6qXT8PU6vLSnQYI7m6GZ2iQnuRrEwVuevDYuQojgRQ
         JgdbG5xKOVKW86YoRYQdWHO+mC7Vct3h2YiYvL5Lx9Ukw/9ECCGRGqlSkKgQTGppYSy9
         Cl4MR4Y6q58tyC1Fqem2oh01WjE6UxPOr4ZzIq4QkauTDulcjkOUDDRjbiqLMSQYPYXs
         Mldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790770439; x=1791375239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2n4+UnejlqYn1u6OpHJx7OaKBKukorY5gDQh8E11BEI=;
        b=dyCw+QhzrhqKZ6hdzWBRJR08QVDUPWKkWEQBykl80SGzs46lJuFGZzhhCoWDzBX68p
         ijfbek1l76kB+8/8T1HMhbKK0CvwtrAhmVg/n/SKkS1eWTGcogsg+hrUeV4WbEYNN2lK
         2DfgjUkv7hpaNanVlO3b3+oUj8T3pedyIpT3O50Gp/KxpsuM7cEguS8SRKZIfFDb0TJ8
         /lqnpZyUupFYWJRrdzSjwLkOuvJzFG9uKnlDmXIHSfBB8xzLgn78I+tEuYbm0nNnwPxD
         uig0F2wFYDZTJDYCMcqWCoBcKdMtPDZ8fPVC/nw5+sKYGwH4YWJXz1kB3yq05Gh7uNfW
         3wxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxheXVrzOt2RoGuDkl1LwZpIzrIHPApwlwW5atBQBETlzdqopbHoBfHgpOjjiWNCgS2+FBuZLZwJvA5MKb8Ww==@vger.kernel.org
X-Gm-Message-State: AFq9FYKKi67fwKISl+WSBpsoRp2ercBAlrPZGRlShY3vWbpnHho7/PaK
	8QXc4hLKCGr4yimt6uWjJTM1Y2tbPQrM9tEOLov0snWcmC9l7DoQSLem6C6kiw17ZMSYuI5+qS0
	938BVQMzYgPsEIxzfgS7dRAId6HU1/Fw=
X-Gm-Gg: AYBFou2rPt2EKa8jjEj8izh0lkcTbKFymus0yoSij6ayQjKQCJRzXrkf4fIpxildiSZ
	UkS0II6SsKiaF2t+XQbX489EutGokZXQd03SBLcdJp6UIJbqLih6wLyR+G3IbH4FAOBfsSl2gHC
	DzY+0QO7rYjl5jR1OTp0SQ32YHTAFAa+KYKaI13ePbLLKzYqwjr5f8XyQsjH/olBJ514m8zo5F/
	bn9YZqbwh3Oc3ZD0d1Deknvx84vPTTqAZTJoL127uHTlL0Q9JyDJb+MYQn2LVcxrbu2xYumZRZF
	2BkovNn7YVS3wPspW0Mi5gXZB1WkOT1kw22OYcQOtIBVXoIPSe12N9lBwcgDjyzMaBfZmjtXvWJ
	J4/KwpVIdcNbCemYQT9zcAHlI1sc7bJtHAAe2fKCCMTLbcw1OaqQRDHH/nkDef/b3EzRNQtMpbF
	WBqbT12C8+JWeMvtiO8w0XduwyHy35IxTPP6bYM7ca64hlnhcHaGQ=
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34cde6749bbmr2785844eec.1.1790770438477; Wed, 30 Sep 2026
 05:13:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917051147.98775-1-tweek@google.com>
In-Reply-To: <20260917051147.98775-1-tweek@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 14:13:45 +0200
X-Gm-Features: AclHuK-6adfLavzkp4ECmLqb4CW3_hXGJszcDPcphNHw_O5mw99JF2JHAArmZF8
Message-ID: <CANiq72nRLF7PmqqVUrAiw_M3dYZCr9ifoo+Q4SuXfBQsAFH-pQ@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: allow non-ASCII characters in `authors`
To: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:11=E2=80=AFAM Thi=C3=A9baud Weksteen <tweek@googl=
e.com> wrote:
>
> Module authors may have non-ASCII characters in their names. In C,
> `MODULE_AUTHOR` allows arbitrary string literals which are emitted as
> raw UTF-8 bytes into the `.modinfo` section, and multiple in-tree
> modules use non-ASCII author names.
>
> Originally, the single `author` field permitted arbitrary string literals
> including non-ASCII characters. When support for multiple authors was
> introduced in commit 38559da6afb2 ("rust: module: introduce `authors`
> key"), it reused the `expect_string_array` helper that had originally bee=
n
> added for module aliases. Because that helper enforced an ASCII check,
> `authors` inadvertently became restricted to ASCII-only string literals.
> Later, when the macro parsing was rewritten to use `syn` in commit
> c578ad703ae9 ("rust: macros: use `syn` to parse `module!` macro"), this
> restriction was carried over by using AsciiLitStr in `authors` type.
>
> Change the element type of `authors` in `ModuleInfo` from `AsciiLitStr`
> to `LitStr` so that UTF-8 author names are permitted.
>
> Fixes: 38559da6afb2 ("rust: module: introduce `authors` key")
> Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>

This looks good, thanks! We did discuss allowing non-ASCII long ago,
so this wasn't intentional.

Petr & modules: I can pick this on up (an Acked-by would be nice!),
unless you want to pick it.

By the way:

Cc: stable@vger.kernel.org

Cheers,
Miguel
